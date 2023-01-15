// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Constructor {
    address Owner;
    uint fortune;
    bool deceased;

    constructor() payable public { // constructor is a special function with runs when the coded is deployed
        
        Owner = msg.sender; //msg sender represent address that is being called
        fortune = msg.value; // msg value tells how much ethers are send
        deceased = false;
    }
    

    // we can Create a modifier so the only person who can call the contract is owner

    modifier onlyOwner(){

        require( msg.sender == Owner); // require is the conditional statement which returns wheather the condition is true or false
        _; // it just means just return to the actual function after we're run this modifier
    }

}
