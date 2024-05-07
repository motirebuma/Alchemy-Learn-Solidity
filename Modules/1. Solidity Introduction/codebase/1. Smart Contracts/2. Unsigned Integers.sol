// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    
    uint8 public a = 100;

    uint16 public b = 300;

    uint256 public sum;

    constructor() {
        sum = uint256(a) + uint256(b);
    }
}