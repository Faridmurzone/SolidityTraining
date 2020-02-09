pragma solidity ^0.6.2;
// Using blocktimes (like used in 11_lastwill). In ex "18_" I will use trigger mechanisms.

contract TimeBased {
  mapping(address => uint) public _balanceOf;
  mapping(address => uint) public _expiryOf;
  uint private leaseTime = 1000;

  modifier expire(address _addr) {
    if(_expiryOf[_addr] >= block.timestamp) {
      _balanceOf[_addr] = 0;
      _expiryOf[_addr] = 0;
    }
    _;
  }

  function lease() payable expire(msg.sender) public returns(bool){
    require(msg.value == 1 ether);
    require(_balanceOf[msg.sender] == 0);
    _balanceOf[msg.sender] = 1;
    _expiryOf[msg.sender] = block.timestamp + leaseTime;
  }

  function balanceOf(address _addr) public view returns(uint) {
    return _balanceOf[_addr];
  }

  function expireOf(address _addr) public view returns(uint) {
    return _expiryOf[_addr];
  }

  function balanceOf() public view returns(uint) {
    return balanceOf(msg.sender);
  }

  function expireOf() public view returns(uint) {
    return expireOf(msg.sender);
  }

}