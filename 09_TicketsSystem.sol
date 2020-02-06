pragma solidity ^0.6.2;

contract Tickets {
  struct Person {
    string name;
    uint age;
    bool active;
  }

  uint fee;
  uint loss = 80;

  mapping(address => Person) public attendants;

  function Register(string memory _name, uint _age) payable public {
    if(msg.value == fee) {
      attendants[msg.sender] = Person({
        name: _name,
        age: _age,
        active: true
      });
    } else {
      revert();
    }
  }

  function setRegistrationFee(uint256 _fee) internal {
    fee = _fee;
  }

  function cancelRegistration() public {
    attendants[msg.sender].active = false;
    msg.sender.transfer((fee*loss/100));
  }
}
