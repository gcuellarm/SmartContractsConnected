### 📋 Exercise Connecting Smart Contracts
To use some of the new concepts learnt before, I designed a simple exercise in which there will be four contracts (A, B, C and D). The main objective is contract A sending ether to contract B, but previously contract C has already sent it to contract A. For contract A to be able to send ether to contract B, contract D must set the fee and be in the maximun fee allowed (fee <= 5).

- **Contract A**: it needs B and D to be initialized (Bmust be payable). 
```solidity
constructor(address _contratoB, address _contratoD) {
    contratoB = payable(_contratoB);
    contratoD = _contratoD;
}
```
A must be able to receive ether:
```solidity
receive() external payable {}
```
To send ether:
```solidity
function sendEther(address contractB_) public payable {
    uint256 currentFee = IDContratoD(contratoD).getFee();
    require(currentFee <= 5, "Fee is higher than 5, Ether cannot be sent.");
    require(contractB_ != address(0), "Address is empty");
    
    userBalance[msg.sender] = userBalance[msg.sender] - msg.value;

    (bool success, ) = contractB_.call{value: msg.value}("");

    require(success, "Failure sending Ether to contract B");
}
```

- **Contract B**: this only receives ether:
```solidity
receive() external payable {}
```

- **Contract C**: this needs the address of contrac A to send Ether:
```solidity
 address payable public contractA;

constructor(address payable contractA_) {
    contractA = contractA_;
}

function sendEther(address contractA_) public payable {
    require(contractA_ != address(0), "Direccion invalida");
    
    // Send Ether to contract A
    (bool success, ) = contractA_.call{value: msg.value}("");

    // check if the transaction succeeded or not
    require(success, "Error sending Ether to contract A");
}
```

- **Contract D**: this must have a function to set and get the fee:
```solidity
uint256 public fee;

function setFee(uint256 newFee_) external{
    fee = newFee_;
}

function getFee() external view returns(uint256){
    return fee;
}
```

- **IFee (Interface for D)**: setting the functions in contract D in case A needs to get the fee:
```solidity
interface IFee{
    function setFee(uint256 newFee_) external;
    function getFee() external view returns (uint256);
}
```

## Tech Stack

**Client:** Solidity

**IDE:** Visual Studio Code, Remix IDE


## Authors

- [@gcuellarm](https://www.github.com/gcuellarm)
