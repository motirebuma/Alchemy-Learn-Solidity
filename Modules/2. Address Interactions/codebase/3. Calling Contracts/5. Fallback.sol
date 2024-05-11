pragma solidity ^0.8.20;

contract Sidekick {
    function makeContact(address hero) external {
        (bool success, ) = hero.call(
            abi.encodeWithSignature("")
        );
        require(success);
    }
}