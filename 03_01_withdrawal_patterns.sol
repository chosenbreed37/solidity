// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;


contract WithdrawalPattern1 {
    address owner;


    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor () {
        owner = msg.sender;        
    }   

    function returnFunds(address payable [] memory funders, uint contributedAmount) public payable  onlyOwner returns (bool){
        for (uint256 i = 0; i < funders.length; ++i ) {
            address _funder = funders[i];
          _funder.transfer(contributedAmount);
        }
        return true;
    }

}