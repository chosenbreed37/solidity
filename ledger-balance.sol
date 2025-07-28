// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.30;

contract LedgerBalance {

    mapping (address => uint) public balance;

    function updateBalance(uint newBalance) public {
        balance[msg.sender] = newBalance;
    }
}

contract Updater  {
    LedgerBalance ledgerBalance = new LedgerBalance();

    function updateLedgerBalance(uint newBalance) public  {
         ledgerBalance.updateBalance(newBalance);
    }
}

contract SpecialValues {


    function run() public view returns(uint){
        return block.timestamp;
    }
}