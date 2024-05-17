pragma solidity ^0.8.20;

contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote[] public votes;
    mapping(address => bool) public hasVoted;

    function createVote(Choices choice) external {
        require(!hasVoted[msg.sender], "Already voted");
        votes.push(Vote(choice, msg.sender));
        hasVoted[msg.sender] = true;
    }

    function findChoice(address voter) external view returns (Choices) {
        for (uint256 i = 0; i < votes.length; i++) {
            if (votes[i].voter == voter) {
                return votes[i].choice;
            }
        }
        revert("Vote not found");
    }
}
