// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import {Script} from "forge-std/Script.sol";
import {OurToken} from "../src/OurToken.sol";

contract DeployOurToken is Script {
    // Initial supply of 100 tokens with 18 decimals
    uint256 public constant INITIAL_SUPPLY = 1000 ether;

    function run() external returns (OurToken) {
        vm.startBroadcast();
        OurToken token = new OurToken(INITIAL_SUPPLY); // Deploy the OurToken contract with initial supply
        vm.stopBroadcast();
        return token; // Return the deployed token contract instance
    }
}
