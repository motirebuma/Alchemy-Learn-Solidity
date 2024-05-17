pragma solidity 0.8.20;

contract Contract {
	enum Choices { Yes, No }
	
	struct Vote {
		Choices choice;
		address voter;
	}

	function createVote(Choices choice) external view returns(Vote memory) {
		return Vote(choice, msg.sender);
	}
}