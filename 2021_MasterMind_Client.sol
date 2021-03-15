// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
pragma experimental ABIEncoderV2; //ABI coder v2 is activated by default by v0.8.0
contract MasterMindClient {
    mapping(uint => uint8) secret;
    address mmMaster;
    
    event playedEv (bool, uint8 , uint8);
    event attemptsEv (uint8);
    
    constructor (address payable _address_master) {
        mmMaster=_address_master;
    }

    
   function play (uint8[] memory _bet) external  returns (bool, uint8 , uint8) {
        (bool success, bytes memory data) = mmMaster.call(abi.encodeWithSignature("play(uint8[])", _bet));
        require(success);
        (bool won, uint8 correct, uint8 almostCorrect)= abi.decode(data, (bool, uint8 , uint8 ));
        emit playedEv(won, correct, almostCorrect);
        return (won, correct, almostCorrect);
   }
   
   function getAttempts() external returns (uint8) {
        (bool success, bytes memory data) = mmMaster.call(abi.encodeWithSignature("getAttempts()"));
        require(success);
        (uint8 attempts)= abi.decode(data, (uint8 ));
        emit attemptsEv(attempts);
        return (attempts);
   }
}
