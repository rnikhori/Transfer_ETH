// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract A {
    address payable public contractB;
    address payable public contractD;

    constructor(address payable _contractB,address payable _contractD) {
        contractB = _contractB;
        contractD = _contractD;
    }
    
   function sendToB() external payable {
        contractB.transfer(msg.value);
    }

    function sendToD() external payable {
      contractD.transfer(msg.value);
    
    }
}

contract B {
    address payable public contractC;

    constructor(address payable _contractC) {
        contractC = _contractC;
    }

    receive() external payable {
     contractC.transfer(msg.value);

    }
}

contract C {
    receive() external payable {}
}

contract D {
    receive() external payable {
        revert("D does not accept Ether");
    }
}
