// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
pragma experimental ABIEncoderV2;
/// @title Voting with delegation.
contract underscore {
    
    uint public a;
    
    constructor() {
        a=10;
    }

    modifier conditionalChangeAtoThirty() {
      // _;
        if (a == 20){
            a = 30;  
        }
        _;
    }
      
    function changeaToTwenty() public conditionalChangeAtoThirty {
        a = 20;
    } 
        
}