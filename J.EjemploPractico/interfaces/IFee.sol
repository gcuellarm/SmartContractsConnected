//SPDX-License-Identifier: LGPL-3.0-only

//Version
pragma solidity ^0.8.24;

//interfaz
interface IFee{
    function setFee(uint256 newFee_) external;
    function getFee() external view returns (uint256);
}