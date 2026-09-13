// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
contract SupplyVerify {
 struct Batch {address custodian;bytes32 digest;uint stage;} mapping(bytes32=>Batch) public batches;
 event Handover(bytes32 indexed id,address indexed from,address indexed to,uint stage);
 function create(bytes32 id,bytes32 digest) external {require(batches[id].custodian==address(0),"exists");batches[id]=Batch(msg.sender,digest,0);}
 function handover(bytes32 id,address to) external {Batch storage b=batches[id];require(b.custodian==msg.sender && to!=address(0),"custodian");address old=b.custodian;b.custodian=to;b.stage++;emit Handover(id,old,to,b.stage);}
}