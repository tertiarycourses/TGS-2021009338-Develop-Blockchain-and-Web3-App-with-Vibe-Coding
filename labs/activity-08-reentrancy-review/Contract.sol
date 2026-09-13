// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
contract SafeVault {
 mapping(address=>uint) public balance; bool private entered;
 function deposit() external payable {balance[msg.sender]+=msg.value;}
 function withdraw() external {require(!entered,"reentrant");uint value=balance[msg.sender];require(value>0,"empty");entered=true;balance[msg.sender]=0;(bool ok,)=msg.sender.call{value:value}("");require(ok,"send");entered=false;}
}
contract ReenterProbe {
 SafeVault public vault; bool public blocked;
 constructor(address v){vault=SafeVault(v);}
 function attack() external payable {vault.deposit{value:msg.value}();vault.withdraw();}
 receive() external payable {try vault.withdraw() {} catch {blocked=true;}}
}