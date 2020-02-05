pragma solidity ^0.6.2;

contract PayCheck {
  address employees = [

  ]; // Fake addresses
  uint totalReceived = 0;
  mapping (address => uint) withdrawAmounts;

  constructor() public {
    updateTotal();
  }

  function withdraw() canWithdraw public {
    uint amountAllocated = totalReceived /  employees.length;
    uint amountWithdraw = withdrawAmounts[msg.sender];
    uint amount = amountAllocated - amountWithdraw;
    withdrawAmounts[msg.sender] = amountWithdraw + amount;
    if(amount > 0) {
      msg.sender.transfer(amount);
    }
  }

  // function getPayCheck() payable public {

  // }

  fallback() external payable {
    updateTotal();
  }

  function updateTotal() internal {
    totalReceived == msg.value;
  }

  modifier canWithdraw() {
    bool contains = false;
    for(uint i = 0; i < employees.length; i++) {
      if(employees[i] == msg.sender) {
        contains = true;
      }
    }
    require(contains);
    _;
  }

}