// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./RentalContract.sol";

contract BookingService {
    struct Property {
        address owner;
        RentalContract rentalContract;
    }

    Property[] public properties;

    mapping(address => uint[]) public ownerProperties;

    event PropertyAdded(uint256 propertyId, address owner, address rentalContract);

    function addProperty(string memory metadataURI, uint256 rent) public {
        RentalContract rentalContract = new RentalContract(payable(msg.sender), rent, metadataURI);
        properties.push(Property(msg.sender, rentalContract));
        uint256 propertyId = properties.length - 1;
        ownerProperties[msg.sender].push(propertyId);
        emit PropertyAdded(propertyId, msg.sender, address(rentalContract));
    }

    function getPropertiesByOwner(address owner) public view returns(uint[] memory) {
        return ownerProperties[owner];
    }
}