pragma solidity ^0.8.20;

contract Contract {
function double(uint _value) external pure returns (uint) {
        
        return _value * 2;
    }
   function double(uint _value1, uint _value2) external pure returns (uint, uint) {
      
        return (_value1 * 2, _value2 * 2);
    }   
}