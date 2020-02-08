pragma solidity ^0.6.2;

contract AsmIf {
  function nativeConditional(uint _v) public returns(uint _r) {
    if(5 == _v) {
      return 55;
    } else if(6 == _v) {
      return 66;
    }
    return 11;
  }

  function AsmConditional(uint _v) public returns(uint _r) {
    assembly {
      switch _v
      case 5 {
        _r := 55
      }
      case 6 {
        _r :=66
      }
      default {
        _r := 11
      }
    }
  }
}