// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;


contract WelcomeToSolidity {
    constructor()  {

    }

    string name = "John Doe";

    function getResult() public pure returns(uint){
        uint a = 1;
        uint b = 3;
        uint result = a+b;
        return result;
    }

    function getName() public view returns(string memory){
        return name;
    }

    function setName(string memory _name) public  {
        name = _name;
    }

    function getLength(string memory value) public pure returns (uint)  {
        bytes memory _valueBytes = bytes(value);
        return uint(_valueBytes.length);
    }
}
