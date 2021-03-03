pragma solidity >=0.4.0;
contract PassaggioProprietaImmobili {
    
    string counter;
    string dati;
    
    int private count = 0; 
    //event changedCount(int count);
    
    function incrementCounter() public {
        count += 1;
        //emit changedCount(count);
    }
    function decrementCounter() public {
        count -= 1;
    }
    function getCount() public view returns (int256) {
        if (count==0) return 1;
        return count;
    }
    function getHello() public pure returns ( string memory) {
        return "Ciao Fabio";
    }
}