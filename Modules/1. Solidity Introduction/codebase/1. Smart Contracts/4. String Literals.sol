// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    
    bytes32 public msg1 = "Hello World";

    // Declare a public string storage variable msg2 storing a string literal that requires over 32 bytes to store
    string public msg2 = "This is a long string that requires more than 32 bytes to store";

    // Constructor
    constructor() {}
}
