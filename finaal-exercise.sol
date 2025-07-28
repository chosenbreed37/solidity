// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract FinalExercise {
    uint256 a = 300;
    uint256 b = 12;
    uint256 f = 47;

    function finalize() public view returns (uint256) {
        uint256 d = 23;

        if (a >= b && b < f) {
            return d * d - b;
        }
        return d;
    }
}
