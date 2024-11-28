// SPDX-License-Identifier: MIT  
pragma solidity ^0.8.0;  
import "./Storage.sol";  
contract LogicV1 {  
    Storage public dataStorage;  
    
    constructor(Storage _storage) {  
        dataStorage = _storage;  
    }  

    function getData() external view returns (uint256) {  
        return dataStorage.data();  
    }  
}