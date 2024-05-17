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

        // Create a new user with 100 tokens and mark them as active
        users[msg.sender] = User(100, true);
    }
}
