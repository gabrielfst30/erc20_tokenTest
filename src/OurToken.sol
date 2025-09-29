// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OurToken is ERC20 {
    // The constructor mints an initial supply of tokens to the deployer's address
    constructor(uint256 initialSupply) ERC20("OurToken", "OTT") {
        // Mint the initial supply to the contract deployer
        _mint(msg.sender, initialSupply);
    }
}
