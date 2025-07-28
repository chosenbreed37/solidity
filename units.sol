// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Units {
    function test() public pure{
        assert(1 minutes == 60 seconds);
        assert(2 hours == 120 minutes);
        assert(1 days == 24 hours);

        assert(1 ether == 1e18 wei);
        assert(1 ether == 1e9 gwei);

        // globals
        // msg
        // block
    }
}