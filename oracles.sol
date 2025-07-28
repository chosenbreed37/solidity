// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

contract Oracle {
    address admin;
    uint public rand;

    constructor () {
        admin = msg.sender;
    }

    function setRand(uint value) public {
        require(msg.sender == admin, "only admin can call this");
        rand = value;
    }
}

contract GenerateRandomNumber {
    Oracle oracle;

    constructor(address oracleAddress) {
        oracle = new Oracle(oracleAddress);
    }

    function generateRandomNumber(uint value) public returns (uint) {
        uint randomNumber = uint(keccak256(abi.encodePacked((block.timestamp % 10), rand, msg.sender)))%value;
         oracle.setRand(randomNumber);
         return randomNumber;
    }
}