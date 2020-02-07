pragma solidity ^0.6.2;

contract RatonPerez {
  address mother = 0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C; // Replace by mother adress 
  address payable child = 0x4B0897b0513fdC7C541B6d9D7E929C4e5364D2dB; // Replace by child adress
  address toothFairy;
  bool toothPaid = false;
  enum ToothState {Mouth, WaitingFallenAproval, Fallen}
  ToothState public toothState = ToothState.Mouth;

    constructor() payable public {
        toothFairy = msg.sender;
    }

    modifier onlyChild {
		if (msg.sender != child) {
			revert();
		} else {
			_;
		}
	}
    
    modifier onlyFairy {
		if (msg.sender != toothFairy) {
			revert();
		} else {
			_;
		}
	}
	
	modifier onlyMother {
		if (msg.sender != mother) {
			revert();
		} else {
			_;
		}
	}

    function toothFall() onlyChild public {
        if(toothState == ToothState.Mouth) {
            toothState = ToothState.WaitingFallenAproval;
        } else {
            revert();
        }
    }
    
    function motherApproves() onlyMother public {
        if(toothState == ToothState.WaitingFallenAproval) {
            toothState = ToothState.Fallen;
            payToChild();
        } else {
            revert();
        }
    }
    
    function payToChild() payable public{
        if(toothState == ToothState.Fallen && toothPaid == false) {
            child.transfer(address(this).balance);
            toothPaid = true;
        }
    }
}