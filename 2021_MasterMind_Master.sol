// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
pragma experimental ABIEncoderV2; //ABI coder v2 is activated by default by v0.8.0
contract MasterMindMaster {
    event played (bool, uint8 , uint8);
    address owner;
    mapping(uint => uint8) secret;
     mapping(address => uint8) attempts;

    modifier onlyOwner {
        require(msg.sender == owner, "Only owner can call this function.");
        _; // Qui viene 'iniettato' il codice del metodo chiamante (setSecret per esempio)
    }
    
    
    constructor () {
        owner= msg.sender;
    }

    
   function setSecret(uint8[] memory _secret) public onlyOwner {
        for (uint8 cont=0; cont<5; ++cont){
            secret[cont]=_secret[cont];
        }
    }

   function getSecret() public view onlyOwner returns ( string memory) {
        string memory ret ="La soluzione e': ";
        for (uint8 cont; cont<5; ++cont){
             ret=string(abi.encodePacked(ret, uint8(48 + secret[cont]),","));
        }
        return ret;
    }


    function play(uint8[] memory _bet) public returns (bool, uint8 , uint8 ) {
        attempts[msg.sender]=attempts[msg.sender]+1;
        bool won=true;
        uint8 correct=0;
        uint8 almostCorrect=0;
        bool[5] memory correctPositions = [false, false, false,false,false];
        
        for (uint8 cont; cont<5; ++cont){
            if (secret[cont]==_bet[cont]) {
                correctPositions[cont]=true;
                correct++;
            }
        }
        if (correct!=5) won=false;
        for (uint8 cont; cont<5; ++cont){
            for (uint8 contt; contt<5; ++contt){
                if (cont!=contt && (correctPositions[cont]==false)&&(correctPositions[contt]==false)) {
                     if (_bet[cont]==secret[contt]) {
                         almostCorrect++;
                     }
                }
            }
        }
        emit played (won, correct , almostCorrect);
        return (won, correct, almostCorrect); 
    }
    
    function getAttempts() public view returns (uint8){
        return attempts[msg.sender];
    }
    

//Solidity code should be deterministic, as it will run on multiple nodes. 
// We need an algorithm that is able to generate a random number once, and use it on multiple nodes. 
/*
    function random() public view returns (uint256) {
         return uint(keccak256(abi.encodePacked(block.timestamp, msg.sender,  uint(124)))) %5;
    }
    
    function generate() public view returns (string memory) {
        string memory ret="";
        for (uint i; i<10;i++){
            uint t=random();
            if (t==1) ret=string(abi.encodePacked(ret, "1"));
            if (t==2) ret=string(abi.encodePacked(ret, "2"));
            if (t==3) ret=string(abi.encodePacked(ret, "3"));
            if (t==4) ret=string(abi.encodePacked(ret, "4"));
            if (t==5) ret=string(abi.encodePacked(ret, "5"));
            
            
        }
        return ret;
    }*/
    
}