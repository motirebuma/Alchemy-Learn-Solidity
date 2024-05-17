pragma solidity 0.8.20;

contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote none = Vote(Choices(0), address(0));

    Vote[] public votes;

    function createVote(Choices choice) external {
        require(!hasVoted(msg.sender));
        votes.push(Vote(choice, msg.sender));
    }

    function changeVote(Choices choice) external {
        Vote storage userVote = findVote(msg.sender);
        require(userVote.voter != none.voter);
        userVote.choice = choice;
    }

    function findVote(address voter) internal view returns (Vote storage) {
        for (uint256 i = 0; i < votes.length; i++) {
            if (votes[i].voter == voter) {
                return votes[i];
            }
        }
        return none;
    }

    function hasVoted(address voter) public view returns (bool) {
        return findVote(voter).voter == voter;
    }

    function findChoice(address voter) external view returns (Choices) {
        return findVote(voter).choice;
    }
}
