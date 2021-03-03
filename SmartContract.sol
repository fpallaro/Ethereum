pragma solidity =0.4.19;
contract SmartContract{
    struct Contract{
        string status;
        bool exists;
    }
    mapping (uint => Contract) smartContract; //coppia chiave-valore
    //Contract[] contracts;
    function SmartContract() public{
        Contract contr;
        contr.status = "accepted";
        contr.exists = true;
        smartContract[1] = contr;
    }
   function getSmartContract(uint id) public view returns (
        uint identifier,
        string status,
        bool exists
    ){
        if(smartContract[id].exists){
            identifier = id;
            status = smartContract[id].status;
            exists = smartContract[id].exists;
        }
        else{
            identifier = 0;
            status = "Contract not Found";
            exists = false;
        }
   }
}