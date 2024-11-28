// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; 
contract LibraryManagement { 
    address public librarian; 
    mapping(address => bool) public isStudent; 
    mapping(address => bool) public isTeacher; 
    mapping(address => uint256) public booksBorrowed; 
 
    modifier onlyLibrarian() { 
        require(msg.sender == librarian, "Only librarian can call this function"); 
        _; 
    } 
 
    modifier onlyStudent() { 
        require(isStudent[msg.sender], "Only students can call this function"); 
        _; 
    } 
 
    modifier onlyTeacher() { 
        require(isTeacher[msg.sender], "Only teachers can call this function"); 
        _; 
    } 
 
    constructor() { 
        librarian = msg.sender; 
    } 
 
    function addStudent(address _student) public onlyLibrarian { 
        isStudent[_student] = true; 
    } 
 
    function addTeacher(address _teacher) public onlyLibrarian { 
        isTeacher[_teacher] = true; 
    }

    function borrowBook() public onlyStudent { 
        require(booksBorrowed[msg.sender] < 3, "You can only borrow up to 3 books"); 
        booksBorrowed[msg.sender]++; 
    } 
 
 
    function returnBook() public onlyStudent { 
        require(booksBorrowed[msg.sender] > 0, "You have no books to return"); 
        booksBorrowed[msg.sender]--; 
    } 

    function addBooks(address _student, uint256 _quantity) public onlyTeacher { 
        require(isStudent[_student], "Address is not a registered student");
        require(_quantity > 0, "Quantity must be greater than zero");
        booksBorrowed[_student] += _quantity;
    }

    function removeBooks(address _student, uint256 _quantity) public onlyTeacher { 
        require(isStudent[_student], "Address is not a registered student");
        require(_quantity > 0, "Quantity must be greater than zero");
        require(booksBorrowed[_student] >= _quantity, "Student does not have enough books to remove");
        booksBorrowed[_student] -= _quantity;
    } 
    
}