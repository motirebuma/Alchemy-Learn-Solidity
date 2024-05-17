// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    struct User {
        uint balance;
        bool isActive;
    }

    mapping(address => User) public users;

    // Function to create a new user
    function createUser() external {
        // Ensure that the user does not already exist
        require(!users[msg.sender].isActive, "User already exists");

       
        users[msg.sender] = User(100, true);
    }

    // Function to transfer tokens from the msg.sender to another user
    function transfer(address recipient, uint amount) external {
        // Ensure that both the sender and recipient are active users
        require(users[msg.sender].isActive, "Sender is not an active user");
        require(users[recipient].isActive, "Recipient is not an active user");

       
        require(users[msg.sender].balance >= amount, "Insufficient balance");

       
        users[msg.sender].balance -= amount;
        users[recipient].balance += amount;
    }
}

