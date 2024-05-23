// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StackClub {
    address[] public members;

    function addMember(address newMember) external {
        members.push(newMember);
    }

    function isMember(address member) public view returns (bool) {
        for (uint256 i = 0; i < members.length; i++) {
            if (members[i] == member) {
                return true;
            }
        }
        return false;
    }
}
