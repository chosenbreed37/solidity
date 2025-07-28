// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 <0.9.0;

contract Functions {
    function getResult(uint a, uint b) public pure  returns(uint){
        return a+b;
    }

    function multiplyCalculator(uint a, uint b) public pure returns(uint) {
        return a*b;
    }
}