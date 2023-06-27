/**
 * Clase Ejercicio3C3: Programa con el codigo asociado al ejercicio 3
 * del Capitulo 3 del libro de la asignatura
 * 
 * @author Libro IIP-PRG
 * @version 2015-2016
 */

public class Ejercicio3C3 {
    
    public static void main(String[] args) {

        System.out.println("123456 / 10 se evalua a " + 123456 / 10 
                           + " y 123456 % 10 se evalua a " + 123456 % 10);
        // La expresion a evaluar en este caso es el argumento del 
        // metodo println, por lo que su tipo debe ser String o compatible
        // con String.
        // Como los operadores / y % tienen MAYOR prioridad que el  
        // operador +, las expresiones 123456 / 10 y 123456 % 10, 
        // se evaluan a un valor de tipo int ANTES de aplicar el 
        // operador +. Por tanto, lo que se muestra por pantalla
        // es el resultado de evaluar la siguiente expresion, en 
        // la que SOLO se "suman" literales de tipos String e int:
        // "123456 / 10 se evalua a " + 12345 + " y 123456 % 10 se evalua a " + 6 
        // Observa que esta ultima expresion se evalua de izquierda a 
        // derecha (asociatividad por la izquierda) porque todos los
        // operadores que aparecen en ella tienen la misma prioridad!!
        
        // No se comenta la evaluación del resto de expresiones porque seria
        // equivalente a la ya realizada
        
        System.out.println("123456 / 100 se evalua a " + 123456 / 100 
                           + " y 123456 % 100 se evalua a " + 123456 % 100);
                           
        System.out.println("123456 / 1000 se evalua a " + 123456 / 1000 
                           + " y 123456 % 1000 se evalua a " + 123456 % 1000);
                           
        System.out.println("123456 / 10000 se evalua a " + 123456 / 10000 
                           + " y 123456 % 10000 se evalua a " + 123456 % 10000);
                           
        System.out.println("123456 / 100000 se evalua a " + 123456 / 100000  
                         + " y 123456 % 100000 se evalua a " + 123456 % 100000);
    }
}
