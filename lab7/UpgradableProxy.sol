pragma solidity ^0.8.0; 
import "./Storage.sol" 
contract UpgradableProxy { 
    address public currentLogic; 
    Storage public dataStorage; 
 
    constructor(Storage _storage, address _logic) { 
        dataStorage = _storage; 
        currentLogic = _logic; 
    } 
    modifier onlyLogicContract() { 
        require(msg.sender == currentLogic, "Not the current logic contract"); 
        _; 
    } 
    fallback() external payable { 
        // Delegate call to the current logic contract 
        address implementation = currentLogic; 
        assembly { 
            calldatacopy(0, 0, calldatasize()) 
            let result := delegatecall(gas(), implementation, 0, calldatasize(), 0, 0) 
            returndatacopy(0, 0, returndatasize()) 
            switch result 
            case 0 { revert(0, returndatasize()) } 
            default { return(0, returndatasize()) } 
        } 
    } 
} 