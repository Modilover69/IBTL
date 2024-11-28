pragma solidity ^0.8.0;
contract MyContract {
    uint myNumber;
    function setNumber(uint _number) public {
    myNumber = _number;
    }
    
    function getNumber() public view returns (uint) {
    return myNumber;
    }
}