pragma solidity >=0.5.0 <0.7.0;
// Interaction between two contracts

contract CallerContract {
  CalledContract toBeCalled = new CalledContract(); // Creating an instance of the CalledContract in CallerContract

  function getValue() public view returns(uint) {
    return toBeCalled.getValue(); // Method in the instance created before
  }
}

contract CalledContract {
  uint value = 3;
  function getValue() public view returns(uint) {
    return value;
  }
}