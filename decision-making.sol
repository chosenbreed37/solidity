// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract DecisionMaking {
    uint256 stakingWallet = 10;

    uint256 data = 0;

    function airDrop() public view returns (uint256) {
        require(data > 1, "Not enough stake");
        if (stakingWallet >= 10) {
            return stakingWallet + 10;
        } else {
            return stakingWallet + 1;
        }
    }
}
