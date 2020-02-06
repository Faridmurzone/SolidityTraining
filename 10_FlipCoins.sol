pragma solidity ^0.6.2;

contract FlipCoins {
  address owner;
  uint payPercentaje = 90;

  event Status(string _msg, address user, uint amount);

  constructor() payable public {

  }

  modifier onlyOwner() {
      if(owner != msg.sender) {
        revert();
      } else {
        _;
      }
    }

  function flipCoin() payable public {
    if((block.timestamp % 2) == 0) {
      if(address(this).balance < ((msg.value*payPercentaje/100))) {
        emit Status("Congratulations, you won. But we don't have enought money", msg.sender, address(this).balance);
        msg.sender.transfer(address(this).balance);
      } else {
        emit Status("Congratulations, you won.", msg.sender, address(this).balance);
        msg.sender.transfer(msg.value*(100 - payPercentaje/100));
      }
    } else {
      emit Status("Sorry, you loose. Try again to recover your money...", msg.sender, msg.value);
    }
  }

  function Kill() onlyOwner public {
    emit Status("Contract killed. Not longer available to use", msg.sender, address(this).balance);
    selfdestruct(msg.sender);
  }

}