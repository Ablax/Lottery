// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

import {Script, console} from "forge-std/Script.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {VRFCoordinatorV2Mock} from "@chainlink/contracts/src/v0.8/vrf/mocks/VRFCoordinatorV2Mock.sol";

contract CreateSubscription is Script {
    function createSubscriptinoUsingConfig() public returns (uint64) {
        HelperConfig helperConfig = new HelperConfig();
        (,, address vrfCoordinator,,,) = helperConfig.activeNetworkConfig();
        return createSubscirption(vrfCoordinator);
    }

    function createSubscirption(address vrfCoordinator) public returns (uint64) {
        console.log("Creating subscription on chainId: ", block.chainid);
        vm.startBroadcast();
        uint64 subscriptionId = VRFCoordinatorV2Mock(vrfCoordinator).createSubscription();
        vm.stopBroadcast();
        console.log("Subscription ID: ", subscriptionId);

        return subscriptionId;
    }

    function run() external returns (uint64) {
        return createSubscriptinoUsingConfig();
    }
}

contract FundScribscription is Script {
    uint96 public constant FUND_AMOUNT = 3 ether;

    function FundScribscriptionUsingConfig() public {
        HelperConfig helperConfig = new HelperConfig();
        (,, address vrfCoordinator,, uint64 subId,) = helperConfig.activeNetworkConfig();
    }

    function run() external {
        FundScribscriptionUsingConfig();
    }
}