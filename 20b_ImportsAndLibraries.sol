pragma solidity ^0.6.2;

library IntExtended {
  function increment(uint _self) public returns(uint){
    return _self + 1;
  }
  function decrement(uint _self) public returns(uint){
    return _self - 1;
  }
  function incrementByValue(uint _self, uint _value) public returns(uint){
    return _self + _value;
  }
  function derementByValue(uint _self, uint _value) public returns(uint){
    return _self - _value;
  }
}