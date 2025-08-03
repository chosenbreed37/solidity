// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

library ArrayExtensions {
    function contains(uint256[] storage self, uint256 value)
        public
        view
        returns (bool)
    {
        for (uint256 n = 0; n < self.length; n++) {
            if (self[n] == value) return true;
        }
        return false;
    }
}

contract ArrayExtensionTest {
    using ArrayExtensions for uint256[];
    uint256[] entries = [1, 2, 3, 4];

    function contains(uint256 value) public view returns (bool) {
        return entries.contains(value);
    }
}
