// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Member {
    string name;
    uint age;

    constructor (string memory _name, uint256 _age) {
        name = _name;
        age = _age;
    }
}

 contract Teacher is Member {

    constructor (string memory _name, uint256 _age) Member(_name, _age)  {}
    function getName() public view returns (string memory) {
        return name;
    }
    

}

// Exercise

contract Base {
    uint public data;

    constructor(uint256 _data) {
        data = _data;
    } 
    

}

contract Derived is Base(5) {

}