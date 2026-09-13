// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
contract HashRegistry {
 address public immutable issuer=msg.sender;
 mapping(bytes32=>bool) public registered;
 event Registered(bytes32 indexed digest,address indexed issuer);
 function register(bytes32 digest) external {
  require(msg.sender==issuer,"issuer only"); require(!registered[digest],"duplicate");
  registered[digest]=true; emit Registered(digest,msg.sender);
 }
}