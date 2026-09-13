// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
contract Ballot {
 address public immutable chair=msg.sender; mapping(address=>bool) public eligible; mapping(address=>bool) public voted; mapping(uint=>uint) public votes;
 function enrol(address a) external {require(msg.sender==chair,"chair");eligible[a]=true;}
 function vote(uint option) external {require(eligible[msg.sender] && !voted[msg.sender],"eligibility");require(option<2,"option");voted[msg.sender]=true;votes[option]++;}
}