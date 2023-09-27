// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.8;

contract inventoryManagement {
  struct Inventory {
        uint256 p_ID;
        uint256 quantity;
        string p_Name;
        bool exist;
    }

    mapping (uint256 => Inventory) public inventories;

    function addInventory(uint256 p_ID, uint256 quantity, string memory p_Name) public {
        require(!inventories[p_ID].exist, "Inventory already exists");
        inventories[p_ID] = Inventory(p_ID, quantity, p_Name, true);
    }

    function updateInventory(uint256 p_ID, uint256 quantity, string memory p_Name) public {
        require(inventories[p_ID].exist, "Inventory does not exist");
        inventories[p_ID].quantity = quantity;
        inventories[p_ID].p_Name = p_Name;
    }

    function getInventory(uint256 p_ID) public view returns (string memory, uint256) {
        require(inventories[p_ID].exist, "Inventory does not exist");
        return (inventories[p_ID].p_Name, inventories[p_ID].quantity);
    }

    function removeInventory(uint256 p_ID) public {
        require(inventories[p_ID].exist, "Inventory does not exist");
        delete inventories[p_ID];
    }
}