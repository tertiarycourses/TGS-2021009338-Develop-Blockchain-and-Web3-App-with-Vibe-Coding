// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
contract GasBench {
 uint256[] public values; mapping(uint=>uint) public lookup;
 function append(uint value) external {values.push(value);}
 function write(uint key,uint value) external {lookup[key]=value;}
 function count() external view returns(uint){return values.length;}
}