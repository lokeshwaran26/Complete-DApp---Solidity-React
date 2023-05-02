// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Constructor {
    address Owner;
    uint fortune;
    bool deceased;

    constructor() payable public { // constructor is a special function with runs only once when the code is deployed
        
        Owner = msg.sender; //msg sender make request and save the user public key once the deployed the code in EVM
        fortune = msg.value; // msg value tells how much ethers are send
        deceased = false;
    }
    

    // we can Create a modifier so the only person who can call the contract is owner

    modifier onlyOwner(){

        require( msg.sender == Owner); // require is the conditional statement which returns wheather the condition is true or false
        _; // it just means just return to the actual function after we're run this modifier
    }

    modifier mustbeDeceased (){
        require(deceased == true );
        _;
    }
     
    // This array store the value of addresses this are also can be payable 
    address payable [] familyWallets; 
    // mapping function provide us to map the two data types as key and value
    mapping(address => uint) inheritance;

    //set inheritance for each address

    function setInheritance(address payable _wallet, uint _amount) public {
        familyWallets.push(_wallet); // push function is use push the addess in the familyWallets
        inheritance[_wallet] = _amount; // Here we mapping the _wallet address to _amount
    }

    function payout() private mustbeDeceased {
        for(uint i =0; i<familyWallets.length; i++){
            familyWallets[i].transfer(inheritance[familyWallets[i]]); 
            //transfering the funds to contract adderess to reciever address
        }
    }

    // oracle switch simulation
    function IsDecreased() public onlyOwner{
        deceased = true; 
        payout(); // calling the function payout to transfer all the funds to reciever address
    }
}
