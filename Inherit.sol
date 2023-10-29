// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "./Arrays_&_Structs.sol"  ;

//Inheriting the current contract with the contract in the imported contract

contract InheritaContract is Arrays_Implementation{
    // We can override the function of Arrays_Implementation here

    function Setpeople(uint256 _fav, string memory _name) public override {
        p1.push(People(_fav+69,_name));
        Obj[_fav+69] = _name;

    }

}
