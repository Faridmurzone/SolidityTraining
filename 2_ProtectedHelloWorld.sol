pragma solidity ^0.6.2;

contract HelloWorld {
    string saySomething;
    address owner;

    constructor() public  {
        saySomething = "Hello World!";
        owner = msg.sender;
    }

    function sayHello() public view returns(string memory itSays) {
        return saySomething;
    }

    function setNewHello(string memory newMsg) public returns(string memory newSyas) {
        if(owner != msg.sender){
          return "You cannot modify this contract";
        } 
        saySomething = newMsg;
        return "Piola. Contract modified";
    }  
}