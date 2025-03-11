//SPDX-License-Identifier: LGPL-3.0-only

//Version
pragma solidity ^0.8.24;

//contract
contract ContractD{

    uint256 public fee;

    function setFee(uint256 newFee_) external{
        fee = newFee_;
    }

    function getFee() external view returns(uint256){
        return fee;
    }

    
}