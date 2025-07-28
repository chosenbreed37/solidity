// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 <0.9.0;

contract Elections {
    enum Candidate { C1, C2, C3 }
    mapping(address=>bool) private approvedVoters;
    mapping(Candidate=>uint) private votes;
    bytes32 private hashedResult;

    modifier isApproved() {
        require(approvedVoters[msg.sender] == true);
    _   ;
    }

    function vote(Candidate candidate) public payable isApproved {
        votes[candidate]=votes[candidate]+1;
    }

    function getResults() public returns(Candidate, uint){
        uint votesForC1 = votes[Candidate.C1];
        uint votesForC2 = votes[Candidate.C2];
        uint votesForC3 = votes[Candidate.C3];

        Candidate winner = Candidate.C1;
        uint winningVotes = votesForC1;

        if (votesForC2 > winningVotes) {
            winner = Candidate.C2;
            winningVotes = votesForC2;
        }
        if (votesForC3 > winningVotes) {
            winner = Candidate.C3;
            winningVotes = votesForC3;
        }

        hashedResult = keccak256(abi.encode(winner, winningVotes));
        return (winner, winningVotes);
    }
}