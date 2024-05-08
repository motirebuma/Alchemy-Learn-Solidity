pragma solidity ^0.8.20;

contract Contract {
uint public x;
constructor( uint a ){
      x = a;
}
function increment() external{
      x=x+1;
}
function add(uint _y) external view returns (uint) {
       
        return x + _y;
    }
}