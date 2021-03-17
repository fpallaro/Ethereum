// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
// ABIEncoderV2 consente il passaggio di array come struct tra le funzioni o tra i sc
pragma experimental ABIEncoderV2; //ABI coder v2 is activated by default by v0.8.0 
/// @title ChainCourseMaster
contract QuizMaster {
    
    address private owner;
    address private master;
    
    string public question;
    string private solution;
    
    
    
    constructor(string memory _question, string memory _solution) {
        owner= msg.sender;
        master=msg.sender;
        question=_question;
        solution=_solution;
    }
    
    function getQuestion() public view returns (string memory)  {
        return question;
    }
    
    function tryYourSolution(string memory _solution) public returns (string memory)  {
        if (keccak256(bytes(_solution)) == keccak256(bytes(solution))) {
            master=msg.sender;
            return "Bravo!!!! Ora sei tu il master!!! Decidi il prossimo enigma!";
        } else  {
            return "NOOO!! Riprova e forse sari piu' fortunato!";
        }
    }
    
    function setEnigma(string memory _question, string memory _solution) public returns (string memory){
        //require ((msg.sender==master || msg.sender == owner ), "Devi essere il master per cambiare l'enigma!!");    
         if ((msg.sender==master || msg.sender == owner )) {
             question=_question;
            solution= _solution;
            return ("ok, Enigma reimpostato!");
         } else {        
             return ("Devi essere il master per cambiare l'enigma!!");
         }
    }
    
    function getMaster() public view returns (address) {
        return master;
    }
    function getSolution() public view returns (string memory) {
        if ((msg.sender==master || msg.sender == owner )) {
            return solution;
        } else {
            return "Devi essere il master per vedere la soluzione!!";    
        }
    }
}