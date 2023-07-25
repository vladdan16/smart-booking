// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract RentalContract {
    address payable public landlord;
    uint256 public rentPrice;
    string public propertyMetadata;

    struct Booking {
        address tenant;
        uint256 start;
        uint256 end;
        uint256 amount;
    }

    Booking[] public bookings;

    constructor(
        address payable _landlord,
        uint256 _rentPrice,
        string memory _propertyMetadata
    ) {
        landlord = _landlord;
        rentPrice = _rentPrice;
        propertyMetadata = _propertyMetadata;
    }

    modifier onlyOwner {
        require(msg.sender == landlord, "Only the owner can perform this action");
        _;
    }

    function editContract(uint256 _newRentPrice, string memory _newPropertyMetadata) public onlyOwner {
        rentPrice = _newRentPrice;
        propertyMetadata = _newPropertyMetadata;
    }

    function bookProperty(uint256 _start, uint256 _end) public payable {
        require(isAvailable(_start, _end), "The property is not available during the requested period.");

        uint256 bookingDays = (_end - _start) / 1 days;
        uint256 totalCost = bookingDays * rentPrice;

        require(msg.value >= totalCost, "Insufficient funds.");

        if (msg.value > rentPrice) {
            payable(msg.sender).transfer(msg.value - totalCost);
        }

        landlord.transfer(totalCost);
        bookings.push(Booking(msg.sender, _start, _end, totalCost));
    }

    function isAvailable(uint256 _start, uint256 _end) public view returns(bool) {
        if (_start < block.timestamp) {
            return false;
        }
        for (uint256 i = 0; i < bookings.length; i++) {
            if (_start < bookings[i].end && _end > bookings[i].start) {
                return false;
            }
        }
        return true;
    }

    function getTenantBookings(address tenant) public view returns(Booking[] memory) {
        uint256 count = 0;
        for (uint256 i = 0; i < bookings.length; i++) {
            if (bookings[i].tenant == tenant) {
                count++;
            }
        }

        Booking[] memory tenantBookings = new Booking[](count);
        uint256 j = 0;
        for (uint256 i = 0; i < bookings.length; i++) {
            if (bookings[i].tenant == tenant) {
                tenantBookings[j] = bookings[i];
                j++;
            }
        }

        return tenantBookings;
    }

    function getAllBookings() public view returns(Booking[] memory) {
        return bookings;
    }
}
