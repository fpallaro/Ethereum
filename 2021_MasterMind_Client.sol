// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
pragma experimental ABIEncoderV2;
contract MasterMindClient {
    mapping(uint => uint8) secret;
    address mmMaster;
    
    event played (bool, uint8 , uint8);

    constructor (address payable _address_master) {
        mmMaster=_address_master;
    }

    
   function play (uint8[] memory _bet) external  returns (bool, uint8 , uint8) {
        (bool success, bytes memory data) = mmMaster.call(abi.encodeWithSignature("play(uint8[])", _bet));
        require(success);
        (bool won, uint8 correct, uint8 almostCorrect)= abi.decode(data, (bool, uint8 , uint8 ));
        emit played(won, correct, almostCorrect);
        return (won, correct, almostCorrect);
   }
}
