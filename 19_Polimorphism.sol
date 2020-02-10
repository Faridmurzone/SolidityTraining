pragma solidity ^0.6.2;
// Polimorphism refer to de posibility of send msg with equal syntax to objects of different type.

interface Letter {
  function n() public returns(uint);
}

contract A is letter {
  function n() public returns(uint){
    return 1;
  }
}

contract B is A {}

contract C is letter {
  function n() public returns(uint){
    return 2;
  }
  function x() public returns(string) {
    return "x";
  }
}

contract Alphabet {
  Letter[] private letters;
  event Printer(uint);

  constructor() public {
    letters.push(new A());
    letters.push(new B());
    letters.push(new C());
  }
  function loadRemote(address _addrX, address _addrY, address _addrY) public {
    letters.push(Letter(_addrX));
    letters.push(Letter(_addrY));
    letters.push(Letter(_addrZ));
  }
  function printLetters() public {
    for(uint i = 0; i < letters.length; i++) {
        emit Printer(letters[i].n());
    }
  }
}