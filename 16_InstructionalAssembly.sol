pragma solidity ^0.6.2;
// Instructional Assembly. I kept the functional asm exercise to show the difference. 
// Keep an eye on the stack and gas ;)
contract InstructionalAssembly {

  function asmLoops() public returns (uint _r) {
    assembly {
        let i := 0
        loop;
        i := add(i, 1)
        _r := add(_r, 1)
        jumpi(loop, lt(i, 10))
    }
  }
  function inlineAsmLoops() public returns (uint _r) {
      assembly {
        0 // i
        10 // max
        
        loop:
        // i := add(i, 1)
        dup2 
        1
        add
        swap2
        pop
        
        // _r := add(_r, 1)
        dup3 
        1
        add
        swap3
        pop
        
        // lt(i, 10)
        dup1
        dup3
        lt
        
        // jumpi(loop, lt(i, 10))
        loop
        jumpi
        
        pop
        pop
      }
  }
}