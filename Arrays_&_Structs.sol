// SPDX-License-Identifier: MIT
pragma solidity 0.8.12;


contract Arrays_Implementation {
    // Declare variables
    struct People{
        uint256 fav;
        string name;
    }
    People[] p1;
    mapping(uint256 => string) Obj ;
  

    function Setpeople(uint256 _fav , string memory _name) public virtual {
      p1.push(People(_fav,_name));
      Obj[_fav] = _name;
    }
    function Getpeople(uint256 _fav) public view returns (string memory _name) {
      return Obj[_fav] ;
    }



}