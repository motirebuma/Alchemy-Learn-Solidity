// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
   
    int8 public a = 10;   
    int8 public b = -15;  

    // Declare int16 variable difference to store the absolute difference between a and b
    int16 public difference;

    // Constructor to calculate the absolute difference between a and b when the contract is deployed
    constructor() {
        difference = int16(a - b);
    }
}
