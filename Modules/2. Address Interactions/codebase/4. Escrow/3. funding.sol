// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Escrow {
    address public arbiter;
    address public depositor;
    address public beneficiary;

    constructor(address _arbiter, address _beneficiary) payable {
        require(msg.value > 0, "Initial deposit value must be greater than zero");
        arbiter = _arbiter;
        beneficiary = _beneficiary;
        depositor = msg.sender;
    }

    function approve() public {
        require(msg.sender == arbiter, "Only arbiter can approve transfer");
        payable(beneficiary).transfer(address(this).balance);
    }

    function reject() public {
        require(msg.sender == arbiter, "Only arbiter can reject transfer");
        payable(depositor).transfer(address(this).balance);
    }
}
