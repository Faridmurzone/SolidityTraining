pragma solidity ^0.6.2;

contract LastWill {
  address owner;
  uint256 public lastTouch;
  address payable[] public childs;

  event Status(string msg, address user, uint256 time);

  constructor() payable public {
    owner = msg.sender;
    lastTouch = block.timestamp;
    emit Status("LastWill contract was created", msg.sender, block.timestamp);
  }

  modifier onlyOwner() {
    if(msg.sender != owner) {
      revert();
    } else {
      _;
    }
  }

  function depositFunds() payable public {
    emit Status("Funds was deposited", msg.sender, block.timestamp);
  }

  function stillAlive() onlyOwner public {
    lastTouch = block.timestamp;
    emit Status("I still alive", msg.sender, block.timestamp);
  }

  function addChild(address _address) onlyOwner public {
    emit Status("Added new child", _address, block.timestamp);
    childs.push(_address); // Still need control permissions for push into childs
  }

  function isDead() public {
    emit Status("Asking if dead", msg.sender, block.timestamp);
    if(block.timestamp > (lastTouch + 259200000)){
      giveMoneyToChilds();
    } else {
      emit Status("I am not dead yet", msg.sender, block.timestamp);
    }
  }

  function giveMoneyToChilds() public {
    emit Status("I am dead. Hope you cried, take my money", msg.sender, block.timestamp);
    uint amountPerChild = address(this).balance / childs.length;
    for(uint i = 0; i < childs.length; i++) {
      childs[i].transfer(amountPerChild);
    }
  }

}