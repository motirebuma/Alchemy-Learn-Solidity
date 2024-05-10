pragma solidity ^0.8.20;

contract Contract {
    address public deployer;

    constructor() payable {
        require(msg.value >= 1 ether, "you haven't deposited enough ether");
        deployer = msg.sender;
    }
}
