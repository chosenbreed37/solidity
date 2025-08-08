// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 <0.9.0;

contract Vendor {
    address private seller;

    modifier onlySeller() {
        require(msg.sender == seller, "Only seller");
        _;
    }

    function becomeSeller() public {
        seller = msg.sender;
    }

    function sell(uint amount) public payable onlySeller {
        if (msg.value < amount) {
            revert("Not enough funds");
        }
    }
}