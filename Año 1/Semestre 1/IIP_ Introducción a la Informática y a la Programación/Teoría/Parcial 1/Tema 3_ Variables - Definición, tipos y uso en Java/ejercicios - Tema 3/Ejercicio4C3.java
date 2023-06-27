/**
 * Clase Ejercicio4C3: Programa con el codigo asociado al ejercicio 4
 * del Capitulo 3 del libro de la asignatura
 * @author Libro IIP-PRG
 * @version 2015-2016
 */

public class Ejercicio4C3 {
    
    public static void main(String[] args) {
        
        int a = 5, b = 3;
        System.out.println("3 / 4 * (a * a - b) se evalua a " 
                           + 3 / 4 * (a * a - b) 
                           + ", cuando el resultado que se quiere es 16.5");
        System.out.println("Como modificar la expresion para obtenerlo?");
        System.out.println();
        
        int expresion = a / b * 1000 + 304;
        System.out.println("a / b * 1000 + 304 se evalua a " + expresion 
               + ", cuando el resultado que se quiere es 1970.6666666666667");
        System.out.println("Como modificar la expresion para obtenerlo?");
        System.out.println();
        
        System.out.println("(100 / a + b / 2) * 5 se evalua a " 
                           + (100 / a + b / 2) * 5 
                           + ", cuando el resultado que se quiere es 107.5");
        System.out.println("Como modificar la expresion para obtenerlo?");
        System.out.println();
    }
}
