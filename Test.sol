pragma solidity >=0.4.0;
pragma experimental ABIEncoderV2;



contract Test { 
    
    
    int idAtto;
    
    struct Adempimento {
        string tipologia;
        address indirizzo;
    }
    mapping(int => Adempimento[]) public adempimenti;
    
    struct Testamentatario {
        string nome;
        string cognome;
        string paeseNascita;
        string provinciaNascita;
        string dataNascita;
        string paeseResidenza;
        string provinciaResidenza;
        string indirizzoResidenza;
        string civicoResidenza;
        string codiceFiscale;
        string numeroDocumentoIdentita;
    }
    mapping(int => Testamentatario[]) public testamentatari;
       
       
    function getStatoAdempimento(uint256 idAdempimento) public view returns (string) {
        string memory rets="NOP";
        address  indirizzo=adempimenti[0][idAdempimento].indirizzo;
        string storage tipologia=adempimenti[0][idAdempimento].tipologia;
        return rets;
    }  
       
        
    function setIdAtto (int idAttoIn) public {
        idAtto=idAttoIn;
    } 
    
     // Adempimenti
    function getAdempimentiCount() public constant returns (uint) {
        return adempimenti[0].length;
    }
    
    function   addAdempimento (string tipologia, address indirizzo)  public returns (bool) {
        Adempimento memory adempimento;
        adempimento.tipologia=tipologia;
        adempimento.indirizzo= indirizzo;
        adempimenti[0].push(adempimento);
        return true;
    }
    
    
    // Testamentatari
    function getTestamentariCount() public constant returns (uint) {
        return testamentatari[0].length;
    }
    
    function getIdAtto() public constant returns (int) {
        return idAtto;
    }
    
    function   addTestamentario  (string nome, string cognome, string paeseNascita, string provinciaNascita, string dataNascita, string paeseResidenza, string provinciaResidenza, string indirizzoResidenza, string civicoResidenza, string codiceFiscale, string numeroDocumentoIdentita)  public returns (bool) {
        Testamentatario memory test;
        test.nome=nome;
        test.cognome= cognome;
        test.paeseNascita=paeseNascita;
        test.provinciaNascita=provinciaNascita;
        test.dataNascita=dataNascita;
        test.paeseResidenza=paeseResidenza;
        test.provinciaResidenza=provinciaResidenza;
        test.indirizzoResidenza=indirizzoResidenza;
        test.civicoResidenza=civicoResidenza;
        test.codiceFiscale=codiceFiscale;
        test.numeroDocumentoIdentita=numeroDocumentoIdentita;
        testamentatari[0].push(test);
        return true;
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