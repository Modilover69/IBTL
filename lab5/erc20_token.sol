// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract ERC20Token {
    // Token name
    string public name = "MyToken";

    // Token symbol
    string public symbol = "MTK";

    // Fixed supply of tokens
    uint256 public totalSupply = 1000000;

    // Mapping to store balances
    mapping(address => uint256) public balanceOf;

    // Mapping to track allowances for delegated transfers
    mapping(address => mapping(address => uint256)) public allowance;

    // Event to log token transfers
    event Transfer(address indexed from, address indexed to, uint256 value);

    // Event to log approved allowances
    event Approval(address indexed owner, address indexed spender, uint256 value);

    // Constructor to initialize the contract with the total supply
    constructor() {
        balanceOf[msg.sender] = totalSupply;
    }

    // Function to transfer tokens
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");
        balanceOf[msg.sender]-= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    // Function to approve delegated transfers
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    // Function to handle delegated transfers
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool
    success) {
        require(balanceOf[_from] >= _value, "Insufficient balance");
        require(allowance[_from][msg.sender] >= _value, "Not enough allowance");
        balanceOf[_from]-= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender]-= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }
}