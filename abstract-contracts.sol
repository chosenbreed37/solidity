// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

abstract contract CalculatorBase {
    function calculate() public virtual returns (uint);
}

contract Calculator is CalculatorBase {
    function calculate() public pure override returns(uint) {
        return 1 + 2;
    }
}

contract BasicToken {
    string internal name;
    string internal symbol;

    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
    }

    function getName() public view returns (string memory){
        return name;
    }

    function getSymbol() public view returns (string memory){
        return symbol;
    }
}

contract ERC20Token is BasicToken {
    uint internal totalSupply;

    constructor()  BasicToken("ERC20 Token", "ERC20") {
        totalSupply = 1e18;
    }

    function getTotalSupply()   public view returns (uint){
        return totalSupply;
    }
}

contract Wallet {
    ERC20Token private erc20Tokens;

    constructor(ERC20Token _token) {
        erc20Tokens = _token;
    }
    
    function getBalance() public view returns (uint){
        return erc20Tokens.getTotalSupply();
    }
}