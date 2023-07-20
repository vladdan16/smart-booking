// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract RentalContract {
    address payable public landlord;
    address public tenant;
    uint256 public rentPrice;
    string public propertyMetadata;

    struct Booking {
        uint256 start;
        uint256 end;
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

    function bookProperty(uint256 _start, uint256 _end) public payable {
        require(isAvailable(_start, _end), "The property is not available during the requested period.");

        uint256 bookingDays = (_end - _start) / 1 days;
        uint256 totalCost = bookingDays * rentPrice;

        require(msg.value >= totalCost, "Insufficient funds.");

        if (msg.value > rentPrice) {
            payable(msg.sender).transfer(msg.value - totalCost);
        }

        landlord.transfer(totalCost);
        tenant = msg.sender;
        bookings.push(Booking(_start, _end));
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
}
