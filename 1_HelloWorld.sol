pragma solidity ^0.6.2;

contract HelloWorld {
    string saySomething;
    
    constructor() public  {
        saySomething = "Hello World!";
    }

    function sayHello() public view returns(string memory itSays) {
        return saySomething;
    }

    function setNewHello(string memory newMsg) public returns(string memory newSyas) {
        saySomething = newMsg;
        return newMsg;
    }  
}