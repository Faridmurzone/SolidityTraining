pragma solidity ^0.6.2;

contract Savings {
  address payable owner;
  event UpdateStatus(string msg);
  event UpdateUserStatus(string _msg, address _user, uint _amount);
  
  constructor() public {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    if(owner != msg.sender) {
      revert();
    } else {
      _;
    }
  }

  function Kill() onlyOwner public {
    selfdestruct(msg.sender);
  }

  function depositFounds(uint amount) payable public {
    if(owner.send(amount)){
      emit UpdateUserStatus('User deposited some money', msg.sender, msg.value);
    }
  }

  function withdrawFounds(uint amount) onlyOwner public {
    if(owner.send(amount)){
      emit UpdateStatus('User withdraw some money');
    }
  }

  function getFounds() onlyOwner public view returns(uint) {
    address(this).balance;
  }
}