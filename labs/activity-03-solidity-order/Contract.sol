// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
contract PurchaseOrder {
 enum State {Created,Accepted,Delivered} State public state;
 address public immutable buyer=msg.sender; address public supplier;
 uint public immutable quantity; bytes32 public immutable orderId;
 constructor(address s,uint q,bytes32 id){require(q>0,"quantity");supplier=s;quantity=q;orderId=id;}
 function accept() external {require(msg.sender==supplier && state==State.Created,"supplier/state");state=State.Accepted;}
 function deliver() external {require(msg.sender==supplier && state==State.Accepted,"supplier/state");state=State.Delivered;}
}