// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StackClub {
    address[] public members;

    constructor() {
        members.push(msg.sender);
    }

    function addMember(address newMember) external {
        require(isMember(msg.sender), "Only existing members can add new members");
        members.push(newMember);
    }

    function removeLastMember() external {
        require(isMember(msg.sender), "Only existing members can remove members");
        require(members.length > 0, "No members to remove");
        members.pop();
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
