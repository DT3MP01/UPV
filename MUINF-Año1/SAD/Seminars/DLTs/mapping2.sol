pragma solidity ^0.8.11;

contract exampleMapping {
    mapping(address => uint) public recibido;

    function enviaDinero() public payable {
        recibido[msg.sender] += msg.value;

    }

    //realizar una función para que se retire hacia una dirección una cantidad concreta

    function retiraTodoDinero(address payable recip) public {
        uint dineroAportado = recibido[msg.sender];
        recibido[msg.sender] = 0;
        recip.transfer(dineroAportado);
    }


}