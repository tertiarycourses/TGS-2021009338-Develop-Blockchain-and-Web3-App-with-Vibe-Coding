// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
contract EventLedger {
 address public immutable operator=msg.sender;
 mapping(bytes32=>bool) public recorded;
 event Evidence(bytes32 indexed id,bytes32 digest,uint timestamp);
 function record(bytes32 id,bytes32 digest) external {require(msg.sender==operator && !recorded[id],"operator/duplicate");recorded[id]=true;emit Evidence(id,digest,block.timestamp);}
}