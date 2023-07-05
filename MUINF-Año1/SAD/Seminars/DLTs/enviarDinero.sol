ragma solidity ^0.8.7;

contract enviarDinero {
    uint public dineroRecibido;
    
    function recibirDinero() public payable {
        dineroRecibido = msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function retirarDinero() public {
        address payable to = payable(msg.sender);

        to.transfer(this.getBalance());

    }
}

