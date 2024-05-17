pragma solidity 0.8.20;

contract Contract {
    enum Choices { Yes, No }

    Vote public vote;

    struct Vote {
        Choices choice;
        address voter;
    }

    function createVote(Choices choice) external {
        vote = Vote(choice, msg.sender);
    }

    function getVote() external view returns (Choices choice, address voter) {
        return (vote.choice, vote.voter);
    }
}