// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract ConsumerDataFeedPrices {
    AggregatorV3Interface internal ETHUSDpriceFeed;
    AggregatorV3Interface internal BTCUSDpriceFeed;

    /**
     * Network: Goerli
     *
     * Aggregator: ETH/USD
     * Address: 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
     *
     * Aggregator: BTC/USD
     * Address: 0xA39434A63A52E749F02807ae27335515BA4b07F7
     */
    constructor() {
        ETHUSDpriceFeed = AggregatorV3Interface(
            0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        );
        BTCUSDpriceFeed = AggregatorV3Interface(
            0xA39434A63A52E749F02807ae27335515BA4b07F7
        );
    }

    /**
     * Returns the latest price for ETH/USD
     */
    function getETHLatestPrice() public view returns (int) {
        (
            ,
            /*uint80 roundID*/
            int price, /*uint startedAt*/ /*uint timeStamp*/ /*uint80 answeredInRound*/
            ,
            ,

        ) = ETHUSDpriceFeed.latestRoundData();
        return price;
    }

    /**
     * Returns the latest price for BTC/USD
     */

    function getBTCLatestPrice() public view returns (int) {
        (
            ,
            /*uint80 roundID*/
            int price, /*uint startedAt*/ /*uint timeStamp*/ /*uint80 answeredInRound*/
            ,
            ,

        ) = BTCUSDpriceFeed.latestRoundData();
        return price;
    }
}
