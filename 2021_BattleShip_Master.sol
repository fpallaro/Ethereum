// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
// ABIEncoderV2 consente il passaggio di array come struct tra le funzioni o tra i sc
pragma experimental ABIEncoderV2; //ABI coder v2 is activated by default by v0.8.0 

/// @title ChainCourseMaster
contract BattleShipMaster {
    // This declares
    string public battleVersion;
    address private owner;
    uint limitFires=100;
    
    // Id Ledge... Using an array for what you're trying to achieve would be a highly inefficient pattern. The best and most cost efficient method is use a mapping data structure. 
    // Lists that are too long have the possibility of running out of gas when you're trying to iterate over them.
    mapping(uint256 => bool) idLedge;
    
    mapping(uint256 => uint256) counters;
    mapping(uint256 => uint256) points;
    mapping(uint256 => bool[20][20]) fired;


    // Array because mapping can be any use with built-in types plus bytes and string. No reference type or complex objects are allowed.
    //bool[20][20] battleField;
    
    // or 
    mapping (uint8 => mapping (uint8 => bool)) battleFiled_map;

    // to trace events with direct Remix calls with web3
    event fireEvent(bool hit, uint8 returnCode, string error);
    
    constructor(string memory _argument) {
        owner= msg.sender;
        battleVersion =_argument;
        
        //Test
        for(uint8 cont=9;cont<14;cont++){battleFiled_map[cont][1]=true;}for(uint8 cont=4;cont<9;cont++){battleFiled_map[19][cont]=true;}for(uint8 cont=11;cont<16;cont++){battleFiled_map[2][cont]=true;}for(uint8 cont=11;cont<16;cont++){battleFiled_map[cont][19]=true;}
        for(uint8 cont=10;cont<14;cont++){battleFiled_map[cont][17]=true;}for(uint8 cont=0;cont<4;cont++){battleFiled_map[cont][4]=true;}for(uint8 cont=2;cont<6;cont++){battleFiled_map[cont][7]=true;}
        for(uint8 cont=7;cont<9;cont++){battleFiled_map[cont][10]=true;}for(uint8 cont=5;cont<8;cont++){battleFiled_map[11][cont]=true;}
        for(uint8 cont=7;cont<9;cont++){battleFiled_map[cont][14]=true;}for(uint8 cont=13;cont<15;cont++){battleFiled_map[cont][14]=true;}
    }
    
    function  addMatricola (uint _matricola) public returns (string memory)  {
        require (msg.sender==owner, "Non sei il master!!");
        if (idLedge[_matricola]) return "Sei gia' iscritto!";
        idLedge[_matricola]=true;
        return "Ok, ora sei iscritto!";
    }

    function  getBattleVersion() public view returns (string memory) {
       return battleVersion;
    }
    
    function  setBattleVersion (string memory battleVersion_) public {
        require (msg.sender==owner, "Non sei il master!!");
        battleVersion=battleVersion_;
    }
    
    function  getOwner() public view returns (address) {
       return owner;
    }
    
    function  helloWorld() public pure returns (string memory) {
       return "Hello World";
    }
    
    function fire(uint8 x, uint8 y, uint256 _matricola) public returns (bool, uint8, string memory) {
        require (idLedge[_matricola], "Non sei iscritto!");
        bool hit= battleFiled_map[x][y];
        uint8 returnCode=(hit?3:0);
        string memory error=(hit?"Colpito":"Acqua");
        
        if ( counters[_matricola] >= limitFires) {
            error="Hai gia' fatto fuoco troppe volte!";
            returnCode=1;
        }
        if (fired[_matricola][x][y]) { 
            error="Hai gia' colpito in questo punto!";
            returnCode=2;
        }
        if (returnCode==0 || returnCode==3) {
            fired[_matricola][x][y]=true;
            counters[_matricola] += 1; 
            if (returnCode==3) points[_matricola] += 1; 
        }
        emit fireEvent(hit, returnCode, error);
        return  (hit, returnCode, error);
    }
    

    function getCounter(uint256 _matricola) public view returns (uint256) {
        return counters[_matricola];   
    }

    function getPoint(uint _matricola) public view returns (uint) {
        return points[_matricola];   
    }
    
    
}