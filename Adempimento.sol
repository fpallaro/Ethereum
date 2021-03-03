pragma solidity >=0.4.0;
pragma experimental ABIEncoderV2;

contract AttoSC { 
    int idAtto;
    
    struct Adempimento {
        string tipologia;
        string status;
        string dataCreazione;
        string dataUltimaVerifica;
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
    
    
    
        
    function setIdAtto (int idAttoIn) public {
        idAtto=idAttoIn;
    }
    
     // Adempimenti
    function getAdempimentiCount() public constant returns (uint) {
        return adempimenti[0].length;
    }
    
    function   addAdempimento (string tipologia, string status, string dataCreazione, string dataUltimaVerifica)  public returns (bool) {
        Adempimento memory adempimento;
        adempimento.tipologia=tipologia;
        adempimento.status= status;
        adempimento.dataCreazione=dataCreazione;
        adempimento.dataUltimaVerifica=dataUltimaVerifica;
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
    
    
    
    
    
    
    
    
    function test() public pure returns ( string memory) {
        return "Test superato!!!";
    }
}