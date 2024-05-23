// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;

    // Constructor to initialize the contract
    constructor(address _arbiter, address _beneficiary) {
        depositor = msg.sender;
        arbiter = _arbiter;
        beneficiary = _beneficiary;
    }

    
}

