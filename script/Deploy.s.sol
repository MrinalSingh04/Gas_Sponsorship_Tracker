// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/GasSponsorshipTracker.sol";

contract Deploy is Script {
    function run() external {
        vm.startBroadcast();
        new GasSponsorshipTracker();
        vm.stopBroadcast();
    }
}
