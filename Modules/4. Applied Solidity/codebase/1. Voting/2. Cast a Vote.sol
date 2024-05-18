// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }
    
    Proposal[] public proposals;

    function newProposal(address _target, bytes calldata _data) external {
        Proposal memory proposal = Proposal({
            target: _target,
            data: _data,
            yesCount: 0,
            noCount: 0
        });

        proposals.push(proposal);
    }

    function castVote(uint proposalId, bool support) external {
        require(proposalId < proposals.length, "Invalid proposal ID");

        Proposal storage proposal = proposals[proposalId];

        if (support) {
            proposal.yesCount++;
        } else {
            proposal.noCount++;
        }
    }
}