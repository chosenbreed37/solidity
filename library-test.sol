// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

library Compute {
    function square(uint256 value) public pure returns (uint256) {        
        return value * value;
    }
}

contract Calculator {
    function square(uint256 value) public pure returns (uint256) {
        return Compute.square(value);
    }
}
