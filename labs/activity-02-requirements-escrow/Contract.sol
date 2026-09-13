// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
contract Escrow {
 address public immutable buyer; address payable public immutable seller;
 uint public immutable price; bool public funded; bool public released;
 constructor(address payable s,uint p){buyer=msg.sender;seller=s;price=p;}
 function fund() external payable {require(msg.sender==buyer && !funded,"buyer/state");require(msg.value==price,"price");funded=true;}
 function release() external {require(msg.sender==buyer && funded && !released,"buyer/state");released=true;(bool ok,)=seller.call{value:price}("");require(ok,"payment");}
}