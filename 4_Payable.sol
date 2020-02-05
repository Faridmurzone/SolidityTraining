pragma solidity >=0.5.0 <0.7.0;
// This contract add "payable" to a function

contract Payable {
    
  constructor() public {

  }

  function ReceiveFunction() public payable {

  }
  
  function getBalance() public view returns(uint) {
    return address(this).balance;
  }

}