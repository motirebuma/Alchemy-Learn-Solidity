pragma solidity 0.8.20;

contract Ownable {
    constructor() { owner = msg.sender; }
    address owner;
	modifier onlyOwner {
		require(msg.sender == owner);
		_;
	}
}

contract Transferable is Ownable {
	function transfer(address newOwner) external onlyOwner {
		owner = newOwner;
	}
}