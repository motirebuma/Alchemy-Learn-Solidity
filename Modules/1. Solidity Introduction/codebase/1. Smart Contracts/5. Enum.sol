// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    // Define an enum type for different types of foods
    enum Foods { Apple, Banana, Orange, Grapes }

    // Store enum values into variables
    Foods public food1 = Foods.Apple;
    Foods public food2 = Foods.Banana;
    Foods public food3 = Foods.Orange;
    Foods public food4 = Foods.Grapes;

    // Constructor
    constructor() {}
}
