// SPDX-Lisence-Identifier:MIT
pragma solidity ^0.8.0;

 contract PreVote{
   Struct Ballot{
   address  President;
   string  VicePresidient;
    uint   votees;

}
mapping(address => Voter) public voters;
Proposal[] public proposals;

constructor(bytes32[] memory proposalNames) {
    chairperson = msg.sender;
    voters[chairperson].weight = 1;

    for (uint i = 0; i < proposalNames.length; i++) {
        proposals.push(Proposal({
            name: proposalNames[i],
            voteCount: 0
        }));
    }
}

  eventVote(address indexed president, string memeory, uint _votees);
 function selectVote(uint proposalIndex) external {
    require(msg.sender == chairperson, "Only chairperson can vote.");
    require(proposalIndex < proposals.length, "Invalid proposal index.");
    
    voters[msg.sender].voted = true;
    proposals[proposalIndex].voteCount++;
}



