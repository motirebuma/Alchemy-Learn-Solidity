// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
	address public owner;
	address public charity;

	constructor(address _charity) {
		owner = msg.sender;
		charity = _charity;
	}

	receive() external payable { }

	function donate() public {
		(bool success, ) = charity.call{ value: address(this).balance }("");
		require(success);
	}

	function tip() public payable {
		(bool success, ) = owner.call{ value: msg.value }("");
		require(success);
	}
}