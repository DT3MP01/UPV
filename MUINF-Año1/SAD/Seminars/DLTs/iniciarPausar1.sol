pragma solidity ^0.8.3;

contract iniciarpausar {
    address propietario;

    constructor() {
        propietario = msg.sender;
    }

    function enviarDinero() public payable {

    }

    function retirarDineroA(address payable recip) public {
        require(msg.sender == propietario, "No eres el propietario");
        recip.transfer(address(this).balance);
    }
}