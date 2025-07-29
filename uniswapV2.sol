// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// function signature to get pairs
interface IUniswapV2Factory {
    function getPair(address tokenA, address tokenB)
        external
        view
        returns (address pair);
}

// function signature to get reserves for pairs
interface IUniswapV2Pair {
    function getReserves()
        external
        view
        returns (
            uint112 reserve0,
            uint112 reserve1,
            uint32 blockTimestampLast
        );
}

contract UniswapPairs {
    address token0 = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48; // USDC
    address token1 = 0xdAC17F958D2ee523a2206206994597C13D831ec7; // USDT
    address factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f; // Uniswap Factory

    function getReserves() public view returns (uint112, uint112) {
        IUniswapV2Factory uniswapFactory = IUniswapV2Factory(factory);
        address pair = uniswapFactory.getPair(token0, token1);
        IUniswapV2Pair uniswapPair = IUniswapV2Pair(pair);
        (uint112 reserve0, uint112 reserve1,) = uniswapPair.getReserves();

        return (reserve0, reserve1);
    }
}
