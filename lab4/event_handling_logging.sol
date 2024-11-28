pragma solidity ^0.8.0;

contract MyContract{

    uint256 public storedValue;
    event ValueStored(address indexed sender, uint256 value);
    function storedValue(uint256 value) public{
        storedValue = value;
        emit ValueStored(msg.sender, value);
    }
}