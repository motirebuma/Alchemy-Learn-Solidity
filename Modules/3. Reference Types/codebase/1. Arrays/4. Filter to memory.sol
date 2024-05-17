// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
	function filterEven(uint[] calldata x) external pure returns(uint[] memory) {
		// determine the number of even numbers
		uint n;
		for(uint i = 0; i < x.length; i++) {
			if(x[i] % 2 == 0) n++;
		}

		// create an array to fit the even numbers inside
		uint[] memory filtered = new uint[](n);

		// fill the array and return it 
		uint filled = 0;
		for(uint i = 0; i < x.length; i++) {
			if(x[i] % 2 == 0) {
				filtered[filled] = x[i];
				filled++;
			}
		}
		return filtered;
	}
}