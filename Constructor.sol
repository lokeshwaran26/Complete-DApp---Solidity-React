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

}
