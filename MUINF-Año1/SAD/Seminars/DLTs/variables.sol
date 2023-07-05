pragma solidity ^0.8.3;


contract Variables {
    uint256 public entero;

    function setEntero(uint valor) public {
        entero = valor;
    }

    bool public booleano;

    function setBoleano(bool valor) public {
        booleano = valor;
    }

    uint8 public contador;

    function incremContador()  public {
        contador++;
    }

    function decremContador()  public {
        contador--;
    }

    address public direccion;

    function setDireccion(address valor) public {
        direccion = valor;
    }

    function getBalanceDireccion() public view returns(uint) {
        return direccion.balance;
    }

    string public cadena;

    funciton setCadena(string memory valor) public {
        cadena= valor;
    }


}
