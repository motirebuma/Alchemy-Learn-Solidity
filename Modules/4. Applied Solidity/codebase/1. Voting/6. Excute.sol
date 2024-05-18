pragma solidity ^0.8.0;

contract Voting {
    enum VoteStates { Absent, Yes, No }

    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        mapping(address => VoteStates) voteStates;
        bool executed;
    }
    
    Proposal[] public proposals;
    address public deployer;
    mapping(address => bool) public allowedVoters;

    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address indexed voter);
    event ProposalExecuted(uint proposalId);

    constructor(address[] memory _allowedVoters) {
        deployer = msg.sender;
        allowedVoters[deployer] = true;
        for (uint i = 0; i < _allowedVoters.length; i++) {
            allowedVoters[_allowedVoters[i]] = true;
        }
    }

    modifier onlyAllowed() {
        require(allowedVoters[msg.sender], "Not authorized");
        _;
    }

    function newProposal(address _target, bytes calldata _data) external onlyAllowed {
        emit ProposalCreated(proposals.length);
        Proposal storage proposal = proposals.push();
        proposal.target = _target;
        proposal.data = _data;
        proposal.executed = false;
    }

    function castVote(uint _proposalId, bool _supports) external onlyAllowed {
        require(_proposalId < proposals.length, "Invalid proposal ID");

        Proposal storage proposal = proposals[_proposalId];

        // Check if the proposal has already been executed
        require(!proposal.executed, "Proposal already executed");

        if (proposal.voteStates[msg.sender] == VoteStates.Yes) {
            proposal.yesCount--;
        }
        if (proposal.voteStates[msg.sender] == VoteStates.No) {
            proposal.noCount--;
        }

        if (_supports) {
            proposal.yesCount++;
        } else {
            proposal.noCount++;
        }

        proposal.voteStates[msg.sender] = _supports ? VoteStates.Yes : VoteStates.No;

        emit VoteCast(_proposalId, msg.sender);

        // Check if proposal has reached 10 yes votes
        if (proposal.yesCount >= 10) {
            executeProposal(_proposalId);
        }
    }

    function executeProposal(uint _proposalId) internal {
        Proposal storage proposal = proposals[_proposalId];

        // Check if the proposal has already been executed
        require(!proposal.executed, "Proposal already executed");

        // Mark the proposal as executed
        proposal.executed = true;

        // Execute the proposal
        (bool success, ) = proposal.target.call(proposal.data);
        require(success, "Proposal execution failed");

        emit ProposalExecuted(_proposalId);
    }
}