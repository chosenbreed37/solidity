// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 <0.9.0;

contract LearErrorHandling {
    bool private sunny = true;
    bool private umbrella = false;
    uint private finalCalc = 0;

    function solarCalc () public returns (uint){
        require(sunny, "It is not sunny");
        finalCalc += 3;
        return finalCalc;
    }

    function weatherChanger() public {
        sunny = !sunny;
    }

    function bringUmbrella() public {
        revert("No need for an umbrella");
    }
}