// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleContract {

    // Basic data types
    uint public myNumber;       // Unsigned integer
    bool public isActive;       // Boolean
    string public myString;     // String
    address public owner;       // Address

    // Constructor: Initializes the contract with default values
    constructor() {
        myNumber = 100;          // Set a default value
        isActive = true;         // Contract starts as active
        myString = "Hello World"; // Default message
        owner = msg.sender;      // Sets the deployer's address as the owner
    }

    // Public function to update the number
    function setMyNumber(uint _number) public {
        myNumber = _number;
    }

    // Public function to update the string
    function setMyString(string memory _newString) public {
        myString = _newString;
    }

    // Public function to toggle the active status
    function toggleActive() public {
        isActive = !isActive; // Switch between true and false
    }

    // View function to get the owner address
    function getOwner() public view returns (address) {
        return owner;
    }

    // Pure function to add two numbers (no state modification)
    function addNumbers(uint _a, uint _b) public pure returns (uint) {
        return _a + _b;
    }
}
