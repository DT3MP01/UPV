pragma solidity ^0.8.3;

contract iniciarpausar {
    address propietario;
    bool pausado;

    constructor() {
        propietario = msg.sender;
    }

    function setPausado(bool valor) public {
        require(msg.sender == propietario, "Solo el propietario puede pausar el contrato");
        pausado = valor;

    }

    function enviarDinero() public payable {

    }

    function retirarDineroA(address payable recip) public {
        require(msg.sender == propietario, "No eres el propietario");
        require(!pausado, "El contrato esta pausado");
        recip.transfer(address(this).balance);
    }

    function destruteContracto(address payable recip) public {
        require(msg.sender == propietario, "No eres el propietario");
        selfdestruct(recip);
    }
}