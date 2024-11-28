// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; 
contract Storage {  
    address public owner;  
    uint256 public data;  
    constructor() {  
        owner = msg.sender;  
    }  
    modifier onlyOwner() {  
        require(msg.sender == owner, "Not the owner");  
        _;  
    }  
    function setData(uint256 _data) external onlyOwner {  
        data = _data; 
    }  
} 