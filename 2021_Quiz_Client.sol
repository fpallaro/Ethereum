// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
pragma experimental ABIEncoderV2; //ABI coder v2 is activated by default by v0.8.0
contract QuizClient {
    mapping(uint => uint8) secret;
    address mmMaster;
    
    event played (string);
    event question (string);
    event log (string);

    constructor (address payable _address_master) {
        mmMaster=_address_master;
    }

    
   function play (string memory _solution) public returns (string memory) {
        (bool success, bytes memory data) = mmMaster.call(abi.encodeWithSignature("tryYourSolution(string)", _solution));
        require(success);
        (string memory result)= abi.decode(data, (string ));
        emit played(result);
        return  (result);
   }
   
   function getQuestion () public returns (string memory) {
        (bool success, bytes memory data) = mmMaster.call(abi.encodeWithSignature("getQuestion()"));
        require(success);
        (string memory result)= abi.decode(data, (string));
        emit question(result);
        return  (result);
   }
   
   
       
    function setEnigma(string memory _question, string memory _solution) public returns (string memory){
        (bool success, bytes memory data) = mmMaster.call(abi.encodeWithSignature("setEnigma(string,string)",_question, _solution));
        require(success);
        (string memory result)= abi.decode(data, (string));
        emit log(result);
        return result;
    }
    
    function getSolution() public  returns (string memory) {
        (bool success, bytes memory data) = mmMaster.call(abi.encodeWithSignature("getSolution()"));
        require(success);
        (string memory result)= abi.decode(data, (string));
        emit log(result);
        return result;
    }
}