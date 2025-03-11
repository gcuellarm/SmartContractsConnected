//SPDX-License-Identifier: LGPL-3.0-only

//Version
pragma solidity ^0.8.24;

    
//contract
contract ContractB{

    receive() external payable {}

    //withdraw ether
    function withdrawEther(uint256 amount_) public {
        //recipient + .call + {value: ether value} + data
        (bool success, )= msg.sender.call{value: amount_}("");
        require(success, "Transfer failed");

    }
    
    // Function to check last sender
    function checkSender() external view returns (address) {
        return msg.sender;
    }

    // Function to check the origin
    function checkOrigin() external view returns (address) {
        return tx.origin;
    }
}