pragma solidity >=0.5.0 <0.7.0;

contract FaridCoin {
    address public faridcoin;
    mapping (address => uint) public balances;

    event Sent(address from, address to, uint amount);

    constructor() public {
        faridcoin = msg.sender;
    }

    function farid(address receiver, uint amount) public {
        require(msg.sender == faridcoin);
        require(amount < 1e60);
        balances[receiver] += amount;
    }

    function send(address receiver, uint amount) public {
        require(amount <= balances[msg.sender], "Insufficient balance.");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}
