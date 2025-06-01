// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GasSponsorshipTracker {
    mapping(address => uint256) public sponsoredBalance;

    event Sponsored(address indexed sponsor, address indexed beneficiary, uint256 amount);
    event Withdrawn(address indexed beneficiary, uint256 amount);

    function sponsor(address beneficiary) external payable {
        require(msg.value > 0, "No ETH sent");
        sponsoredBalance[beneficiary] += msg.value;
        emit Sponsored(msg.sender, beneficiary, msg.value);
    }

    function getSponsoredBalance(address beneficiary) external view returns (uint256) {
        return sponsoredBalance[beneficiary];
    }

    function claimGasSponsorship() external {
        uint256 amount = sponsoredBalance[msg.sender];
        require(amount > 0, "No sponsored ETH");
        sponsoredBalance[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
        emit Withdrawn(msg.sender, amount);
    }
}
