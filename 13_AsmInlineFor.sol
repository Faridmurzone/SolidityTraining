pragma solidity ^0.6.2
// Example doing exactly the same code for native solidity and assembly for solidity.   
contract AsmFor {
  function nativeLoop() public returns(uint _r) {
    for(uint i = 0; i < 10; i++) {
      _r++;
    }
  }

  function asmLoop() public returns(uint _r) {
    assembly {
      let i := 0;
      loop;
      i := add(i, 1);
      _r := add(_r, 1);
      jumpi(loop, lt(i, 10));
    }
  }
}
