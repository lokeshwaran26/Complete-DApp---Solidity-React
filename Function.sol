// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Function {

    uint storeData; 
    
    function getData(uint x) public returns (uint){  // function in solidity which scope is public and returns uint
        
        storeData = x;
        return storeData;  //return the value of storeData

    }
}
