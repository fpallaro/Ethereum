// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <0.9.0;

/** 
 * @title Ballot
 * @dev Implements voting process along with vote delegation
 */
contract UniBallot {
   
    struct Voter {
        uint matricola;
        bool canVote;
        bool voted;  // if true, that person already voted
        uint vote;   // index of the voted proposal
    }

    struct Proposal {
        // If you can limit the length to a certain number of bytes, 
        // always use one of bytes1 to bytes32 because they are much cheaper
        string name;   // short name (up to 32 bytes)
        uint voteCount; // number of accumulated votes
    }

    address public chairperson;

    mapping(address => Voter) private voters;

    Proposal[] public proposals;

    /** 
     * @dev Create a new ballot to choose one of 'proposalNames'.
     * @param proposalNames names of proposals
     */
       constructor(string[] memory proposalNames) {
        chairperson = msg.sender;

        for (uint i = 0; i < proposalNames.length; i++) {
            // 'Proposal({...})' creates a temporary
            // Proposal object and 'proposals.push(...)'
            // appends it to the end of 'proposals'.
            proposals.push(Proposal({
                name: proposalNames[i],
                voteCount: 0
            }));
        }
    }
    
    /** 
     * @dev Give 'voter' the right to vote on this ballot. May only be called by 'chairperson'.
     * @param voter address of voter
     */
    function giveRightToVote(address voter) public {
        require(
            msg.sender == chairperson,
            "Only chairperson can give right to vote."
        );
        voters[voter].canVote = true;
    }

    /**
     * @dev Give your vote (including votes delegated to you) to proposal 'proposals[proposal].name'.
     * @param proposal index of proposal in the proposals array
     */
    function voteById(uint proposal) private {
        Voter storage sender = voters[msg.sender];
        require(sender.canVote, "Has no right to vote");
        require(!sender.voted, "Already voted.");
        sender.voted = true;
        sender.vote = proposal;

        // If 'proposal' is out of the range of the array,
        // this will throw automatically and revert all
        // changes.
        proposals[proposal].voteCount += 1;
    }
    
     /**
     * @dev Give your vote (including votes delegated to you) to proposal 'proposals[proposal].name'.
     * @param _proposal name of proposal in the proposals array
     */
    function vote(string memory _proposal) public {
        Voter storage sender = voters[msg.sender];
        require(sender.canVote, "Has no right to vote");
        require(!sender.voted, "Already voted.");
        sender.voted = true;
        uint voteId;
         for (uint p = 0; p < proposals.length; p++) {
            if (keccak256(bytes(proposals[p].name)) == keccak256(bytes(_proposal)) ) {
                voteId=p;
                proposals[p].voteCount += 1;
                break; 
            }
         }
        
        sender.vote = voteId;

        // If 'proposal' is out of the range of the array,
        // this will throw automatically and revert all
        // changes.
       
    }

    /** 
     * @dev Computes the winning proposal taking all previous votes into account.
     * @return winningProposal_ index of winning proposal in the proposals array
     */
    function winningProposal() private  view
            returns (uint winningProposal_)
    {
        uint winningVoteCount = 0;
        for (uint p = 0; p < proposals.length; p++) {
            if (proposals[p].voteCount > winningVoteCount) {
                winningVoteCount = proposals[p].voteCount;
                winningProposal_ = p;
            }
        }
    }

    /** 
     * @dev Calls winningProposal() function to get the index of the winner contained in the proposals array and then
     * @return winnerName_ the name of the winner
     */
    function winnerName() public view
            returns (string memory winnerName_)
    {
        winnerName_ = proposals[winningProposal()].name;
    }
    
    function getAllVotes() public view
            returns (Proposal[] memory)
    {

       return proposals;
    }
}
