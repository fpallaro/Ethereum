pragma solidity =0.4.19;
contract SmartContract_BC{
    
    uint id;
    string description;
    
    struct PersonalData{
        string name;
        string surname;
        string gender;
        string birthPlace;
        string birthDay;
        string cityOfResidense;
        string adress;
        string taxPayerCode;
        string mail;
        string cellphone;
        string phone;
        string cryptocurrency;
        string hashWalletCryptocurrency;
    }
    PersonalData[] personalData;
    uint private personalDataCount = 0;
    uint constant private OK = 200;
    uint constant private INTERNAL_ERROR = 500;
    uint constant private NOT_IMPLEMENTED = 501;
    
    struct InputData1{
        bool accepted;
        string date;
        string description;
    }
    InputData1 inputData1;
    struct OutputData1{
        string contractStream;
		 string date;
        string status;
    }
    OutputData1 outputData1;
    struct InputData2{ 
        string description;
        string cryptoType;
        string sellerPublicKey;
        string buyerWallet;
        string buyerName;
        string amount;
        string causal;
    }
    InputData2 inputData2;
	
    struct OutputData2{
        string date;
        string status;
    }
    OutputData2 outputData2;
	
    struct InputData3{
        string image;
        string description;
        string value;
        string serialNumber;
        string oldOwner;
        string newOwner;
        string grantType;
    }
    InputData3 inputData3;
    struct OutputData3{
        string date;
        string status;
    }
    OutputData3 outputData3;
    struct Fulfillment1{
		string id;
        string name;
        string description;
        InputData1 inputData;
        OutputData1 outputData;
    }
    Fulfillment1 fulfillment1;
    Functions functions1;
    //uint private Fulfillment1Count = 0;
    struct Fulfillment2{
		string id;
        string name;
        string description;
        InputData2 inputData;
        OutputData2 outputData;
    }
    Fulfillment2 fulfillment2;
    Functions functions2;
    //uint private Fulfillment2Count = 0;
    struct Fulfillment3{
		string id;
        string name;
        string description;
        InputData3 inputData;
        OutputData3 outputData;
    }
    Fulfillment3 fulfillment3;
    Functions functions3;
    //uint private Fulfillment3Count = 0;
    struct Functions { }
    /*struct FulfillmentsTree{
        Fulfillment1 fulfillment1;
        Functions functions1;
        Fulfillment2 fulfillment2;
        Functions functions2;
        Fulfillment3 fulfillment3;
        Functions functions3;
    }*/
    //FulfillmentsTree fulfillmentsTree;
    
    function setSmartContractId(uint _id) public returns(uint){
        id = _id;
        return OK;
    }
    
    function getSmartContractId() public view returns(uint){
        return id;
    }
    
    function setSmartContractDescription(string _description) public returns(uint){
        description = _description;
        return OK;
    }
    
    function getSmartContractDescription() public view returns(string){
        return description;
    }
    
    function getPersonalDataCount() public view returns(uint){
        return personalDataCount;
    }
    
    function addPersonalData1_NameSurnameGender(string _name, string _surname, string _gender) public returns(uint){
        PersonalData memory temp;
        
        temp.name = _name;
        temp.surname = _surname;
        temp.gender = _gender;
        personalData.push(temp);
        
        //personalDataCount = personalDataCount + 1;
        
        return personalDataCount++;
    }
    
    function addPersonalData2_birth(uint _id, string _birthPlace, string _birthDay) public returns(uint){
        if(_id < personalData.length){    
            personalData[_id].birthPlace = _birthPlace;
            personalData[_id].birthDay = _birthDay;
           return OK;
        }else return INTERNAL_ERROR;
        
    }
    
    function addPersonalData3_CityAddressTax(uint _id, string _cityOfResidense, 
            string _adress, string _taxPayerCode) public returns(uint){
        if(_id < personalData.length){    
            personalData[_id].cityOfResidense = _cityOfResidense;
            personalData[_id].adress = _adress;
            personalData[_id].taxPayerCode = _taxPayerCode;
            return OK;
        } else return INTERNAL_ERROR;
        
    }
	
    function addPersonalData4_mailCellPhoneCryptoHash(uint _id, string _mail, string _cellphone, string _phone, string _cryptocurrency, 
            string _hashWalletCryptocurrency) public returns(uint) {
      if(_id < personalData.length){    
        personalData[_id].mail = _mail;
        personalData[_id].cellphone = _cellphone;
        personalData[_id].phone = _phone;
        personalData[_id].cryptocurrency = _cryptocurrency;
        personalData[_id].hashWalletCryptocurrency = _hashWalletCryptocurrency;
        
        return OK;
    } else return INTERNAL_ERROR;
	}
    
    function getPersonalDataById_idNameSurnameGender(uint _id) public view returns(
        uint __id,
        string _name,
        string _surname,
        string _gender){
        if(_id < personalData.length){
            __id = _id;
            _name = personalData[_id].name;
            _surname = personalData[_id].surname;
            _gender = personalData[_id].gender;
        }
    }
    
     function getPersonalDataById_idBirth(uint _id) public view returns(
        uint __id,
        string _birthPlace,
        string _birthDay){
        if(_id < personalData.length){
            __id = _id;
            _birthPlace = personalData[_id].birthPlace;
            _birthDay = personalData[_id].birthDay;
        }
    }
    
     function getPersonalDataById_idCityAddressTax(uint _id) public view returns(
        uint __id,
        string _cityOfResidense,
        string _adress,
        string _taxPayerCode) {
        if(_id < personalData.length){
            __id = _id;
            _cityOfResidense = personalData[_id].cityOfResidense;
            _adress = personalData[_id].adress;
            _taxPayerCode=personalData[_id].taxPayerCode;
        }
    }
    
    function getPersonalDataById_MailCellPhoneCryptoHash(uint _id) public view returns(

        string _mail,
        string _cellphone,
        string _phone,
        string _cryptocurrency,
        string _hashWalletCryptocurrency){
        if(_id < personalData.length){
            _mail = personalData[_id].mail;
            _cellphone = personalData[_id].cellphone;
            _phone = personalData[_id].phone;
            _cryptocurrency = personalData[_id].cryptocurrency;
            _hashWalletCryptocurrency = personalData[_id].hashWalletCryptocurrency;
        }
    }
    
    function setInputDataAuth_accDateDescr(bool _accepted, string _date, string _description) public returns(uint){
        inputData1.accepted = _accepted;
        inputData1.date = _date;
        inputData1.description = _description;
        return OK;
    }
	
	function setInputDataAuth_accepted(bool _accepted) public returns(uint){
        inputData1.accepted = _accepted;
        return OK;
    }
	
	function setOutputDataAuth_data(string _date) public returns(uint){
        outputData1.date = _date;
        return OK;
    }

    
    function getInputDataAuth_accDateDescr() public view returns(
        bool _accepted, 
        string _date, 
        string _description){
            _accepted = inputData1.accepted;
            _date = inputData1.date;
            _description = inputData1.description;
        
    }
    
    function setOutputDataAuth_cStream(string _contractStream) public  returns(uint){
        outputData1.contractStream = _contractStream;
        return OK;
    }
    
    function getOutputDataAuth_cStream() public view returns(
        string _contractStream){
            _contractStream = outputData1.contractStream;
        }
    
    function setInputDataCrypto_descrCryptoBuyerPkWallNameAmount(string _description, string _cryptoType, string _sellerPublicKey, string _buyerWallet, 
            string _buyerName, string _amount, string _causal) public returns(uint){
        inputData2.description = _description;
        inputData2.cryptoType = _cryptoType;
        inputData2.sellerPublicKey = _sellerPublicKey;
        inputData2.buyerWallet = _buyerWallet;
        inputData2.buyerName = _buyerName;
        inputData2.amount = _amount;
		inputData2.causal= _causal;
        return OK;
    }
    
    function getInputDataCrypto_descrCryptoBuyerPkWallNameAmount() public view returns(
        string _description, 
        string _cryptoType, 
        string _sellerPublicKey, 
        string _buyerWallet, 
        string _buyerName, 
        string _amount,
		string _causal){
            _description = inputData2.description;
            _cryptoType = inputData2.cryptoType;
            _sellerPublicKey = inputData2.sellerPublicKey;
            _buyerWallet = inputData2.buyerWallet;
            _buyerName = inputData2.buyerName;
            _amount = inputData2.amount;
			_causal=inputData2.causal;
        }
    
    function setOutputDataCrypto_dateStatus(string _date, string _status) public returns(uint){
        outputData2.date = _date;
        outputData2.status = _status;
        return OK;
    }
	
	function setOutputDataCrypto_date(string _date) public returns(uint){
        outputData2.date = _date;
        return OK;
    }
    
	function getOutputDataAuth_date() public view returns(
	string _date){
		_date = outputData1.date;
	}
	
	function getOutputDataOwner_date() public view returns(
	string _date){
		_date = outputData3.date;
	}
		
    function getOutputDataCrypto_dateStatus() public view returns(
        string _date, 
        string _status){
            _date = outputData2.date;
            _status = outputData2.status;
        }
    
	
	    
    function getOutputDataOwner_dateStatus() public view returns(
        string _date, 
        string _status){
            _date = outputData3.date;
            _status = outputData3.status;
        }
		
    function setInputDataOwner_image (string _image) public returns(uint){
        inputData3.image = _image;
        return OK;
    }
    
	    function setOutputDataOwner_dateStatus(string _date, string _status) public returns(uint){
        outputData3.date = _date;
        outputData3.status = _status;
        return OK;
    }
	
	function setOutputDataOwner_date(string _date) public returns(uint){
        outputData3.date = _date;
        return OK;
    }
    
    function setInputDataOwner_imgDescrValSerNOldOwnNewOwnGType(string _description, string _value, string _serialNumber, 
            string _oldOwner, string _newOwner, string _grantType) public returns(uint){
        inputData3.description = _description;
        inputData3.value = _value;
        inputData3.serialNumber = _serialNumber;
        inputData3.oldOwner = _oldOwner;
        inputData3.newOwner = _newOwner;
        inputData3.grantType = _grantType;
        return OK; 
    }
   
   function getInputDataOwner_image() public view returns(
        string _image){
            _image = inputData3.image;
        }
    
    
    function getInputDataOwner_imgDescrValSerNOldOwnNewOwnGType() public view returns(
        string _description, 
        string _value, 
        string _serialNumber, 
        string _oldOwner, 
        string _newOwner, 
        string _grantType){
            _description = inputData3.description;
            _value = inputData3.value;
            _serialNumber = inputData3.serialNumber;
            _oldOwner = inputData3.oldOwner;
            _newOwner = inputData3.newOwner;
            _grantType = inputData3.grantType;
        }
    
    function setOutputDataOwner() public pure returns(uint){
        return NOT_IMPLEMENTED;
    }
    
    function getOutputDataOwner() public pure returns(
        uint){
        return NOT_IMPLEMENTED;//http error: not implemented
    }
    
    function setFulfillmentAuth_idNameDescr(string _id, string _name, string _description) public returns(uint){
        fulfillment1.id = _id;
		fulfillment1.name = _name;
        fulfillment1.description = _description;
            
        return OK;
    }
	
    
    function getFulfillmentAuth_idNameDescr() public view returns(
        string _id, 
		string _name, 
        string _description){
			_id = fulfillment1.id;
            _name = fulfillment1.name;
            _description = fulfillment1.description;
        }
    
    function setFulfillmentAuth_inputOutputData(bool inputData1_accepted, string inputData1_date, string inputData1_description, 
            string outputData1_contractStream,string outputData1_date, string outputData1_status) public returns(uint){
                
        //fulfillment1.inputData = InputData1(inputData1_accepted, inputData1_date, inputData1_description);
		inputData1.accepted=inputData1_accepted;
		inputData1.date=inputData1_date;
		inputData1.description=inputData1_description;
		
        //fulfillment1.outputData = OutputData1(outputData1_contractStream, outputData2_date,  outputData2_status);
		outputData1.contractStream=outputData1_contractStream;
		outputData1.date=outputData1_date;
		outputData1.status=outputData1_status;
		
        return OK;
    }
    
    function getFulfillmentAuth_inputOutputData() public view returns(
        bool inputData1_accepted, 
        string inputData1_date, 
        string inputData1_description, 
		string outputData1_contractStream,
		string outputData1_date){
            inputData1_accepted = inputData1.accepted;
            inputData1_date = inputData1.date;
            inputData1_description = inputData1.description;
            outputData1_contractStream = outputData1.contractStream;
			outputData1_date = outputData1.date;
        }
    
    function setFulfillmentCrypto_idNameDescr(string _id, string _name, string _description) public returns(uint){
        fulfillment2.id = _id;
		fulfillment2.name = _name;
        fulfillment2.description = _description;
        
        return OK;
    }
    
    function getFulfillmentCrypto_idNameDescr() public view returns(
        string _id, 
		string _name, 
        string _description){
            _id = fulfillment2.id;
            _name = fulfillment2.name;
            _description = fulfillment2.description;
        }
    
    function setFulfillmentCrypto_inputData(string inputData2_description, string inputData2_cryptotype, string inputData2_sellerPublicKey, string inputData2_buyerWallet, 
            string inputData2_buyerName, string inputData2_amount, string inputData2_causal) public returns(uint){
        
        //fulfillment2.inputData = InputData2(inputData2_description, inputData2_cryptotype, inputData2_sellerPublicKey, inputData2_buyerWallet, inputData2_buyerName, inputData2_amount, inputData2_causal);
		
		inputData2.description = inputData2_description;
            inputData2.cryptoType =      inputData2_cryptotype;
            inputData2.sellerPublicKey = inputData2_sellerPublicKey;
            inputData2.buyerWallet = 	 inputData2_buyerWallet;
            inputData2.buyerName =       inputData2_buyerName;
            inputData2.amount =    		 inputData2_amount;
			inputData2.causal =    		 inputData2_causal;
		
		
		
        return OK;
    }
    
    function setFulfillmentCrypto_outputData(string outputData2_date, string outputData2_status) public returns(uint){
        
        fulfillment2.outputData = OutputData2(outputData2_date, outputData2_status);
        return OK;
    }
	
    function getFulfillmentCrypto_inputData() public view returns(
        string inputData2_description, 
        string inputData2_cryptotype, 
        string inputData2_sellerPublicKey, 
        string inputData2_buyerWallet, 
        string inputData2_buyerName, 
        string inputData2_amount,
		string inputData2_causal ){
            inputData2_description = inputData2.description;
            inputData2_cryptotype = inputData2.cryptoType;
            inputData2_sellerPublicKey = inputData2.sellerPublicKey;
            inputData2_buyerWallet = inputData2.buyerWallet;
            inputData2_buyerName = inputData2.buyerName;
            inputData2_amount = inputData2.amount;
			inputData2_causal = inputData2.causal;
        }
        
    function getFulfillmentCrypto_outputData() public view returns(
        string outputData2_date, 
        string outputData2_status){
            outputData2_date = outputData2.date;
            outputData2_status = outputData2.status;
        }
    
    function setFulfillmentOwner_idNameDescr(string _id, string _name, string _description) public returns(uint){
        fulfillment3.id = _id;
		fulfillment3.name = _name;
        fulfillment3.description = _description;
        
        return OK;
    }
    
    function getFulfillmentOwner_idNameDescr() public view returns(
        string _id, 
		string _name, 
        string _description){
            _id = fulfillment3.id;
			_name = fulfillment3.name;
            _description = fulfillment3.description;
        }
    
    function setFulfillmentOwner_inputData(string inputData3_image, string inputData3_description, string inputData3_value, string inputData3_serialNumber,
            string inputData3_oldOwner, string inputData3_newOwner, string inputData3_grantType) public returns(uint){
        
		
		//fulfillment3.inputData = InputData3(inputData3_image, inputData3_description, inputData3_value, inputData3_serialNumber, 
         //   inputData3_oldOwner, inputData3_newOwner, inputData3_grantType);
        
		inputData3.image=inputData3_image;
		inputData3.description=inputData3_description;
		inputData3.value=inputData3_value;
		inputData3.serialNumber=inputData3_serialNumber;
		inputData3.oldOwner=inputData3_oldOwner;
		inputData3.newOwner=inputData3_newOwner;
		inputData3.grantType=inputData3_grantType;
		
        return OK;
    }
    
    function getFulfillmentOwner_inputData() public view returns(
        string inputData3_image, 
        string inputData3_description, 
        string inputData3_value, 
        string inputData3_serialNumber,
        string inputData3_oldOwner, 
        string inputData3_newOwner, 
        string inputData3_grantType){
            inputData3_image = inputData3.image;
            inputData3_description = inputData3.description;
            inputData3_value = inputData3.value;
            inputData3_serialNumber = inputData3.serialNumber;
            inputData3_oldOwner = inputData3.oldOwner;
            inputData3_newOwner = inputData3.newOwner;
            inputData3_grantType = inputData3.grantType;
        }
    
    function setFulfillmentOwner_outputData() public pure returns(uint){
        return NOT_IMPLEMENTED;
    }
    
    function getFulfillmentOwner_outputData() public pure returns(
        uint){
            return NOT_IMPLEMENTED; //http code for:"not implemented"
        }
		
		
		
		
		
		
}