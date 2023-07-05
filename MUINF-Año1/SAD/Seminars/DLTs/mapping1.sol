pragma solidity ^0.8.11;

contract ejemploMapping {
    mapping(uint => bool) public mimapping;

    function setMapping(uint ind) public {
        mimapping[ind] = true;
    }

}