// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract WorkshopToken is ERC20 {constructor() ERC20("Workshop Credits","WSC"){_mint(msg.sender,1000000*10**decimals());}}