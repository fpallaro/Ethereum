pragma solidity >=0.4.0;
pragma experimental ABIEncoderV2;
  
contract Adempimento_RISC_POLIZZA_VITA_SC { 
    int idAtto;
    int idAdempimento;
	string tipologia;
    bytes32 status;
    string dataCreazione;
    string dataUltimaVerifica;
    string datiPolizza;

    
    
    function setIdAtto (int idAttoIn) public {
        idAtto=idAttoIn;
    }
    
    function getIdAtto () public constant returns (int) {
        return idAtto;
    }
    
    function setIdAdempimento (int idAdempimentoIn) public {
        idAdempimento=idAdempimentoIn;
    }
    
    function getIdAdempimento () public constant returns (int) {
        return idAdempimento;
    }
    
   function setStatus (string statusIn) public {
       
        
        status=stringToBytes32(statusIn);
        
    }
    
    function getStatus () public constant returns (bytes32) {
        return status;
    }
    
    function getStatusStr () public constant returns (string) {
        return bytes32ToStr(status);
    }
    
   function setDataCreazione (string dataIn) public {
        dataCreazione=dataIn;
    }
    
    function getDataCreazione () public constant returns (string) {
        return dataCreazione;
    }
    
    function setDataUltimaVerifica (string dataIn) public {
        dataUltimaVerifica=dataIn;
    }
    
    function getDataUltimaVerifica () public constant returns (string) {
        return dataUltimaVerifica;
    } 
    
    function setDatiPolizza (string dataIn) public {
        datiPolizza=dataIn;
    }
    
    function getDatiPolizza () public constant returns (string) {
        return datiPolizza;
    } 
    
    
    function stringToBytes32(string memory source) private pure returns (bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }
    
        assembly {
            result := mload(add(source, 32))
        }
    }
    
        
   function bytes32ToStr(bytes32 _bytes32) public pure  returns (string){

        bytes memory bytesArray = new bytes(32);
        for (uint256 i; i < 32; i++) {
            bytesArray[i] = _bytes32[i];
            if (_bytes32[i]==0x0) {
                bytesArray[i]=" ";
            }
        }
        return string(bytesArray);
    }
    


    
    function test() public pure returns ( string memory) {
        return "Test superato!!!";
    }
}