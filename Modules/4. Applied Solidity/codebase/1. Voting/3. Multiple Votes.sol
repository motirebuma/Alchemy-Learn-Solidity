pragma solidity ^0.8.20;

contract Voting {
    enum VoteStates {Absent, Yes, No}

    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        mapping (address => VoteStates) voteStates;
    }
    
    Proposal[] public proposals;
    
    function newProposal(address _target, bytes calldata _data) external {
        Proposal storage proposal = proposals.push();
        proposal.target = _target;
        proposal.data = _data;
    }

    function castVote(uint _proposalId, bool _supports) external {
        Proposal storage proposal = proposals[_proposalId];

        if(proposal.voteStates[msg.sender] == VoteStates.Yes) {
            proposal.yesCount--;
        }
        if(proposal.voteStates[msg.sender] == VoteStates.No) {
            proposal.noCount--;
        }

        if(_supports) {
            proposal.yesCount++;
        }
        else {
            proposal.noCount++;
        }

        proposal.voteStates[msg.sender] = _supports ? VoteStates.Yes : VoteStates.No;
    }
}