pragma solidity ^0.6.2;

contract mortal {
  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  modifier onlyOwner {
    if(msg.sender != owner){
      revert();
    } else {
      _;
    }
  }

  function kill() onlyOwner public {
    selfdestruct(msg.sender); // Función selfdestruct si el contrato tiene ether se lo devuelve al creador y deja de funcionar
  }

}

contract User is mortal {
    string public userName;

    function getUser(string memory _name) public {
      userName = _name;
    }
}

contract Provider is mortal {
  string public userName;

  function getProvider(string memory _name) public {
    userName = _name;
  }

}