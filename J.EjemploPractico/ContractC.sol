//SPDX-License-Identifier: LGPL-3.0-only

//Version
pragma solidity ^0.8.24;

    
//contract
contract ContractC{

    //function + name +(arguments) + visibility + payable? + modifiers + value returned
    function sendEther(address contractA_) public payable {
        require(contractA_ != address(0), "Direccion invalida");
        
        // Send Ether to contract A
        (bool success, ) = contractA_.call{value: msg.value}("");

        // check if the transaction succeeded or not
        require(success, "Error sending Ether to contract A");
    }
    

}