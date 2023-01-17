// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// The contract allows only creator to create a new coins
// Anyone can send coins to each other without the need of registering with username and password
contract Coin {

    address public minter;
    mapping(address => uint) public balances;

    event Sent( address from , address to , uint amount);

    // constructor only runs when we delpoy a contract
    constructor (){
        minter = msg.sender;
    }

    // make new coin and send them to an address
    // only the owner can sedn this coins

    function mint( address _receiver, uint _amount) public {
        require(msg.sender == minter);
        balances [_receiver ] += _amount;
    } 

    // send a x amount od coins 
    // to an existing address

    error insufficientBalance(uint requested, uint available);

    function send( address _receiver, uint _amount) public {
        // require the amount should be greater than balance
        if(_amount > balances[msg.sender])
        revert insufficientBalance({
            requested : _amount,
            available : balances[msg.sender]
        });
        balances[msg.sender] -= _amount; 
        balances[_receiver] += _amount;

        emit Sent(msg.sender, _receiver, _amount);
    }

    

}
