// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "./Arrays_&_Structs.sol" ;

contract ImportContracts {

//Creating array of contracts , the contract name in the imported sol is Arrays, 
//so creating an object for Array of contract(Arrays_Implementation) naming it to object Obj. 

    Arrays_Implementation[] ArrObj;
//Now we can create  array of Arrays_Implementation contract.
//Lets write a function to create object every time we deploy it . As we are creating object everytime and appending it into
// the array, the values are not overwritten but are stored as array

function ImplementArrayofContracts() public {
    //Create an object for the contract / Class
    Arrays_Implementation AI = new Arrays_Implementation();
//Push the object created into the array
    ArrObj.push(AI);
}

// Let's interact with the contract and use the functions defined in that contract

function InteractwiththeContract(uint256 _index, uint256 _fav, string memory _name) public {
   // Arrays_Implementation AI = ArrObj[_index];
   // AI.Setpeople(_fav,_name);
   ArrObj[_index].Setpeople(_fav,_name);
}
function Getinfo(uint256 _index , uint256 _fav) public view returns(string memory _name) {
  //  Arrays_Implementation AI = ArrObj[_index];
  //AI.Getpeople(_fav);
  //We can directly call retrieve function fot the respective index object
    return ArrObj[_index].Getpeople(_fav);
}

}
// NOTES : This actually implement array of arrays
// The current contract stores Array of previous contracts but in the previous contract is an Array
// Ex : Object at index zero can store names for multiple fav num ( Obj at index 0 is an Array so as all the indices)