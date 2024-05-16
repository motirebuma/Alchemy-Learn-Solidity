// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
	mapping(address => bool) public members;

	function addMember(address x) external {
		members[x] = true;
	}

	function removeMember(address x) external {
		members[x] = false;
	}

	function isMember(address x) external view returns(bool) {
		return members[x];
	}
}