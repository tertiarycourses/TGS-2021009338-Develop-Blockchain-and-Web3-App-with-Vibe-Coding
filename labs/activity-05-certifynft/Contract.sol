// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
contract CertificateNFT is ERC721 {
 address public immutable issuer=msg.sender;
 mapping(uint=>bytes32) public documentHash; mapping(uint=>bool) public revoked;
 constructor() ERC721("Course Certificate","CERT"){}
 function issue(address learner,uint id,bytes32 digest) external {require(msg.sender==issuer,"issuer");documentHash[id]=digest;_safeMint(learner,id);}
 function revoke(uint id) external {require(msg.sender==issuer,"issuer");require(_ownerOf(id)!=address(0),"missing");revoked[id]=true;}
}