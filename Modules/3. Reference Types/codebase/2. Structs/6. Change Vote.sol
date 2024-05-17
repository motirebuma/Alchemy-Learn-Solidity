pragma solidity 0.8.20;

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

    function changeVote(Choices choice) external {
        require(hasVoted[msg.sender], "Has not voted yet");
        Vote storage userVote = findVote(msg.sender);
        userVote.choice = choice;
    }

    function findVote(address voter) internal view returns (Vote storage) {
        for (uint256 i = 0; i < votes.length; i++) {
            if (votes[i].voter == voter) {
                return votes[i];
            }
        }
        revert("Vote not found");
    }

    function findChoice(address voter) external view returns (Choices) {
        return findVote(voter).choice;
    }
}
