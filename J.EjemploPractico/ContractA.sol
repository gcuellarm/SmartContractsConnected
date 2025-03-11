//SPDX-License-Identifier: LGPL-3.0-only

//Version
pragma solidity ^0.8.24;

import "./interfaces/IFee.sol";
//contract
contract ContractA{

    address payable public contractB;
    address public contractD;
    uint256 public fee;
    
    constructor(address _contractB, address _contractD) {
        contractB = payable(_contractB);
        contractD = _contractD;
    }
    
    // Receive Ether from ContractC
    receive() external payable {}

    //function + name +(arguments) + visibility + payable? + modifiers + value returned
    function sendAEtherToContratoB(uint256 amountToSend_) external {
        uint256 currentFee = IFee(contractD).getFee();
        require(currentFee <= 5, "Fee is higher than 5, Ether can't be sent.");

        uint256 balanceA = address(this).balance;
        
        // transfer() to send ether to contractB
        contractB.transfer(amountToSend_);
        
        // Check BalanceA has decreased
        require(address(this).balance == balanceA - amountToSend_, "Contract A balance didn't adjust properly.");
    }

    

    function setFee(uint256 newFee_) external {
        IFee(contractD).setFee(newFee_);
    }

//withdraw ether
    function withdrawEther(uint256 amount_) public {
        //recipient + .call + {value: ether value} + data

        (bool success, )= msg.sender.call{value: amount_}("");
        require(success, "Transfer failed");

    }

}