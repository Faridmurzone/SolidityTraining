pragma solidity ^0.6.2;

contract Fallback {
  event Log(uint gas);
  function() external payable {
    // Send and transfer forwards 2300 gas to this fallback function
    emit Log(gasleft()); // and here we expend that gas xD
  }

  function getBalance() public view returns(uint) {
    return address(this).balance;
  }

}

contract SendToFallback {
    function trasferToFallback(address payable _to) public payable {
    _to.transfer(msg.value);
    }
    function callFallback(address payable _to) public payable {
      (bool, sent, ) = _to.call.value(msg.value)("");
      require(sent, "Failed to send Ether");
    }
  }