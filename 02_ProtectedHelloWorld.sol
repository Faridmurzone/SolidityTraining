pragma solidity ^0.6.2;

contract HelloWorld {
    string saySomething;
    address owner;

    constructor() public  {
        saySomething = "Hello World!";
        owner = msg.sender;
    }

    modifier onlyOwner {
      if(owner != msg.sender) {
        revert();
      } else {
        _;
      }
    }

    function sayHello() public view returns(string memory itSays) {
        return saySomething;
    }

    function setNewHello(string memory newMsg) public onlyOwner returns(string memory newSyas) {
        saySomething = newMsg;
        return "Piola. Contract modified";
    }  
}