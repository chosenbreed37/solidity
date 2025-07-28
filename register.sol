// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Owner {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier costs(uint price) {
        require(msg.value >= price);
        _;
    }
}

contract Register is Owner {
    mapping(address => bool) registry;
    uint256 price;

    constructor(uint256 initialPrice) {
        price = initialPrice;
    }

    function register() public payable costs(price) {
        require(!registry[msg.sender]);
        registry[msg.sender] = true;
    }

    // onlyOwner is a function modifier
    // the intention is that only the owner of the contract can change the price
    function changePrice(uint256 newPrice) public onlyOwner {
        price = newPrice;
    }  
}
