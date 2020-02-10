pragma solidity ^0.6.2;

import "./20b_ImportsAndLibraries.sol"; // Importing a demo library

contract TestLibrary {
  using IntExtended for uint; // Using it

  function testIncrement(uint _base) public returns(uint) { // First option to pass parameters to the lib
    return _base.increment();
  }
  function testIncrementOptionB(uint _base) public returns(uint) { // Second option
    return IntExtended.increment(_base);
  }
  function testDecrement(uint _base) public returns(uint) {
    return _base.decrement();
  }
  function testIncrementByValue(uint _base, uint _val) public returns(uint) {
    return _base.incrementByValue(_val);
  }
  function testDecrementByValue(uint _base, uint _val) public returns(uint) {
    return _base.derementByValue(_val);
  }
}