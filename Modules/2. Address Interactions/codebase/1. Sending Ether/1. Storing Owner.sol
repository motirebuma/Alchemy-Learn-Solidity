// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
   
    address public owner;


    constructor() {
        owner = msg.sender;
    }
}
