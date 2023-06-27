/**
 * Clase Prueba: Programa con el codigo asociado al ejercicio 1
 * del Capitulo 3 del libro de la asignatura
 * 
 * @author Libro IIP-PRG
 * @version 2015-2016
 */

public class Prueba {
    
    public static void main(String[] args) {
        
        double x, y; 
        x = 5.0;
        y = 7 / 9 * (x + 1); 
        // y vale 0.0 porque, al tener la misma precedencia / y *, 
        // la aplicación de la asociatividad por la izquierda 
        // hace que se evalue primero 7 / 9, que es 0
        // por ser el cociente de dos int tal que 9 > 7. 
        // Luego, se evalua 0 * (x + 1), que obviamente 
        // vale 0.0 (x + 1 es double)
        System.out.println("x = " + x + " y = " + y);
    }
}
