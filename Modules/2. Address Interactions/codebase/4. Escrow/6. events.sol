// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Escrow {
    address public arbiter;
    address public depositor;
    address payable public beneficiary;

    event Approved(uint256 balance);

    constructor(address _arbiter, address payable _beneficiary) payable {
        require(msg.value > 0, "Initial deposit value must be greater than zero");
        arbiter = _arbiter;
        beneficiary = _beneficiary;
        depositor = msg.sender;
    }

    function approve() external {
        require(msg.sender == arbiter, "Only arbiter can approve transfer");
        uint256 balance = address(this).balance;
        beneficiary.transfer(balance);
        emit Approved(balance);
    }

    function reject() external {
        require(msg.sender == arbiter, "Only arbiter can reject transfer");
        payable(depositor).transfer(address(this).balance);
    }
}
