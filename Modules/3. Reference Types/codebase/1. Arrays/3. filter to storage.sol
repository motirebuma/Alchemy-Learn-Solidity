// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    uint256[] public evenNumbers;

    function filterEven(uint256[] calldata arr) external {
        delete evenNumbers;
        for (uint256 i = 0; i < arr.length; i++) {
            if (arr[i] % 2 == 0) {
                evenNumbers.push(arr[i]);
            }
        }
    }
}
