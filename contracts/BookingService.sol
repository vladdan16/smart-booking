// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./RentalContract.sol";

contract BookingService {
    struct Property {
        address owner;
        RentalContract rentalContract;
    }
    struct TenantBooking {
        address propertyAddress;
        RentalContract.Booking booking;
    }

    Property[] public properties;

    mapping(address => uint[]) public ownerProperties;

    function addProperty(string memory metadataURI, uint256 rent) public {
        RentalContract rentalContract = new RentalContract(payable(msg.sender), rent, metadataURI);
        properties.push(Property(msg.sender, rentalContract));
        uint256 propertyId = properties.length - 1;
        ownerProperties[msg.sender].push(propertyId);
    }

    function getPropertiesByOwner(address owner) public view returns(address[] memory) {
        uint[] memory propertyIds = ownerProperties[owner];
        address[] memory propertyContracts = new address[](propertyIds.length);

        for(uint i = 0; i < propertyIds.length; i++) {
            propertyContracts[i] = address(properties[propertyIds[i]].rentalContract);
        }

        return propertyContracts;
    }

    function getAllProperties() public view returns(address[] memory) {
        address[] memory allPropertyContracts = new address[](properties.length);

        for(uint i = 0; i < properties.length; i++) {
            allPropertyContracts[i] = address(properties[i].rentalContract);
        }

        return allPropertyContracts;
    }

    function getTenantHistory(address tenant) public view returns(TenantBooking[] memory) {
        uint256 count = 0;
        for (uint256 i = 0; i < properties.length; i++) {
            count += properties[i].rentalContract.getTenantBookings(tenant).length;
        }

        TenantBooking[] memory tenantHistory = new TenantBooking[](count);
        uint256 j = 0;
        for (uint256 i = 0; i < properties.length; i++) {
            RentalContract.Booking[] memory bookings = properties[i].rentalContract.getTenantBookings(tenant);
            for (uint256 k = 0; k < bookings.length; k++) {
                tenantHistory[j] = TenantBooking(address(properties[i].rentalContract), bookings[k]);
                j++;
            }
        }

        return tenantHistory;
    }

}