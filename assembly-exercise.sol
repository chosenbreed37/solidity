// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract AssemblyExercise {
    function addToEVM3()
        external
        pure
        returns (bytes memory before, bytes32 converted)
    {
        bytes memory data = new bytes(10);
        uint256 n = 0;
        data[n++] = ("A");
        data[n++] = ("B");
        data[n++] = ("C");
        data[n++] = (0x44);
        data[n++] = (0x45);
        data[n++] = (0x46);
        data[n++] = (0x47);
        data[n++] = (0x48);
        data[n++] = (0x49);
        data[n++] = (0x4A);

        assembly {
            //converted := mload(0x20)
            let loc := mload(0x16)
            mstore(loc, 0x4142434445464748494A)
            converted := mload(add(data, 10))
        }

        return (data, converted);
    }
}
