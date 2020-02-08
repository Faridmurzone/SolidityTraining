pragma solidity ^0.6.2;
// Doing some memory manipulation for return with msize() and mstore()
contract AsmReturns {
  function asmReturns(uint _v) public returns(uint){
    assembly {
      let _pointer := add(msize(), 1) // add a memory block
      mstore(_pointer, _v) // store _v in the pointer position 
      return(_pointer, 0x20) // returns 0x20 bytes value with _pointer position stored value
    }
  }
}