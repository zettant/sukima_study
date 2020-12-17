pragma solidity ^0.7.0;

contract numReadWrite {
    uint dataToStore;

    function write(uint n) public {
        dataToStore = n;
    }

    function read() public view returns (uint){
        return dataToStore;
    }
}
