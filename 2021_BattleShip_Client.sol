// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
pragma experimental ABIEncoderV2; //ABI coder v2 is activated by default by v0.8.0

contract BattleShipClient {
    uint256 public matricola;
    address private sender;
    // This declares
    address payable ccMaster;
    event Fire(bool, uint8 , string );
    event Count(uint256 );
    event Point(uint256 );
    
     constructor(address payable address_master, uint256 _matricola) {
        sender = msg.sender;
        ccMaster=address_master;
        matricola=_matricola;
    }

    function  getHelloWorld() public returns (string memory ) {
         (bool success, bytes memory resultData) = ccMaster.delegatecall(abi.encodeWithSignature("helloWorld()"));
         require(success);
         return abi.decode(resultData, (string));
    }
     
    function  getCounter() public returns (uint256 ) {
        (bool success, bytes memory data) = ccMaster.call(abi.encodeWithSignature("getCounter(uint256)", matricola));
        require(success);
        uint count= abi.decode(data, (uint256));
        emit Count(count);
        return count;
     }
    
    function  getPoint() public returns (uint256 ) {
        (bool success, bytes memory data) = ccMaster.call(abi.encodeWithSignature("getPoint(uint256)", matricola));
        require(success);
        uint points= abi.decode(data, (uint256));
        emit Point(points);
        return points;
     }
     
    function  fire(uint8 _x, uint8 _y) public returns (bool, uint8, string memory ) {
        (bool success, bytes memory data) = ccMaster.call(abi.encodeWithSignature("fire(uint8,uint8,uint256)",_x, _y, matricola));
        require(success);
        (bool test, uint8 returnCode, string memory tmp)= abi.decode(data, (bool, uint8, string));
        emit Fire(test, returnCode, tmp);
        return (test, returnCode, tmp);//(keccak256(bytes(ret)) == keccak256(bytes("Ciao1")));//abi.decode(data, (bool));
     }
     
    function __test() public returns (uint256) {
         for(uint cont=0;cont<19;cont++){
            (bool success, bytes memory data) = ccMaster.call(abi.encodeWithSignature("fire(uint8,uint8,uint256)",cont, 1, matricola));
            require(success);
            (bool test, uint8 returnCode, string memory tmp)= abi.decode(data, (bool, uint8, string));
             emit Fire(test, returnCode, tmp);
         }
        return (getPoint());
     }
     
}
