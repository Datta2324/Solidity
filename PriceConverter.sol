// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
   function GetEthPrice () internal view returns (uint) {
        //ABI
        //Address  0x694AA1769357215DE4FAC081bf1f309aDC325306
        //Goerli 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        // Above is the address of Price feed contract to get the realtime eth price from Chainlink on Goerli Testnet

        AggregatorV3Interface Ethprice = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (,int price ,,,)= Ethprice.latestRoundData();
        return uint(price*1e10);
        //It returns eth price with 8 decimal places our msg.value contains 18 decimals so we are multiplying with 1e10 
        //make this function return 18 decimal.
    }
 // If we want to get funded in terms of Dollars, we need to get the DOLLAR to ETH conversion rate.

    function ConvertUSDtoETH(uint ethAmount) internal view returns (uint){
        uint currentEthPrice= GetEthPrice();
        return (ethAmount*currentEthPrice)/1e18;
    }
}