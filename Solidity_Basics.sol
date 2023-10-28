// SPDX-License-Identifier: MIT
pragma solidity 0.8.12;

contract Learn_Sol {
    // Declare variables
    int256 public Num1 = 2324;
    string name;
    uint public getnum ;
    mapping (string => uint256) public nametofavnum;
// Function with param
    function setnum(uint256 _getnum , string memory _name) public {
           getnum  = _getnum;
           name = _name;
        

    }
//View function to retrieve data from Blockchain

    function display() public view  returns(string memory) {
        return name;
    }
// Creating a struct

    struct People{
        uint256 fav;
        string name;
    }
//Struct Object
    People[] public p1;

// Array and Mapping
    function Setpeople(uint256 _fav , string memory _name) public {
      p1.push(People(_fav,_name));
      nametofavnum[_name] = _fav;
    }

}
