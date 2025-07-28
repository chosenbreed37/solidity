// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract LoopingPractice {
    uint256[] private longList = [
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13,
        14,
        15,
        16,
        17,
        18,
        19,
        20
    ];
    uint256[] private shortList = [1, 4, 34, 56];

    function countEventNumbers() public view returns (uint256) {
        uint256 count = 0;
        for (uint256 n = 0; n < longList.length; n++) {
            if (longList[n] % 2 == 0) count++;
        }
        return count;
    }

    function isInShortList(uint256 input) public view returns (bool) {
        for (uint256 i = 0; i < shortList.length; i++) {
            // for every element in the array, check if the value matches 'input' and return true or false
            if ((shortList[i]) == input) {
                //if match then found
                return true; //return true
            }
        }
        return false;
    }
}
