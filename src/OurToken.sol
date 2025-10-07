// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OurToken is ERC20 {
    // O construtor minteia um fornecimento inicial de tokens para o endereço do deployer
    constructor(uint256 initialSupply) ERC20("OurToken", "OTT") {
        // Minteia o fornecimento inicial para o deployer do contrato
        _mint(msg.sender, initialSupply);
    }
}
