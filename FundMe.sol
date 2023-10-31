// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
import "./PriceConverter.sol";

contract SendMeDollars{
    using PriceConverter for uint;
    address[] public fundersAddress;
    mapping(address => uint) AddressToFunds;
    address owner;
    constructor(){
        owner = msg.sender;
    }
    function fundme() public payable {
        //Funder must send minimum 1$
        require(msg.value.ConvertUSDtoETH() >= 1 * 1e18,"More Give me Moree!!!");
        fundersAddress.push(msg.sender) ;
        AddressToFunds[msg.sender] += msg.value ;
    }   
// In withdraw function we are clearing  the funders data and withdrawing the ETH / Dollars from the Smart Contract 
//to our wallet 

    function withdraw() public onlyOwner{
        for(uint i = 0 ; i < fundersAddress.length; i++){
        //funderAddress contains all the addresses of funders, we are looping through that array and taking address 
        //at each index and assigning its value to Zero.
           AddressToFunds[fundersAddress[i]] = 0;
        }
        //After setting the Values of the respected Address to Zero lets clear all the addresses
        fundersAddress = new address[](0);
        //Now withdraw money from contract
     //   payable(msg.sender).transfer(address(this).balance);
     //It is used to call any functions , It returns two values
     // 1. Bool value  If the call is success or not
     // 2. Bytes value to store the data from the function
     // Here as we are not calling any function we are not taking the Bytes value
        (bool callStatus, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callStatus, "Call failed");
    } 
    modifier onlyOwner{
        require(owner == msg.sender, "You are not allowed to Withdraw !!!"); 
        _;
    }
}