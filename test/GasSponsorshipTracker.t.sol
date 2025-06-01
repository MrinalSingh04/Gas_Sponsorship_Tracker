// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/GasSponsorshipTracker.sol";

contract GasSponsorshipTrackerTest is Test {
    GasSponsorshipTracker public tracker;

    address sponsor = address(0x1);
    address user = address(0x2);

    function setUp() public {
        tracker = new GasSponsorshipTracker();
        vm.deal(sponsor, 10 ether);
        vm.deal(user, 1 ether);
    }

    function testSponsorFunds() public {
        vm.prank(sponsor);
        tracker.sponsor{value: 1 ether}(user);

        uint256 balance = tracker.getSponsoredBalance(user);
        assertEq(balance, 1 ether);
    }

    function testClaimFunds() public {
        vm.prank(sponsor);
        tracker.sponsor{value: 2 ether}(user);

        vm.prank(user);
        tracker.claimGasSponsorship();

        assertEq(user.balance, 3 ether); // 1 ether initial + 2 sponsored
        uint256 remaining = tracker.getSponsoredBalance(user);
        assertEq(remaining, 0);
    }

    function testRevertOnZeroClaim() public {
        vm.expectRevert("No sponsored ETH");
        vm.prank(user);
        tracker.claimGasSponsorship();
    }
}
