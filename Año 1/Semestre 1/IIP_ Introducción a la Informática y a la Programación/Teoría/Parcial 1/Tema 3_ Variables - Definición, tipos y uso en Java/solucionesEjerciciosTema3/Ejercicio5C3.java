/**
 * Clase Ejercicio5C3: Programa con el codigo asociado al ejercicio 5
 * del Capitulo 3 del libro de la asignatura
 * 
 * @author Libro IIP-PRG
 * @version 2015-2016
 */

public class Ejercicio5C3 {
    
    public static void main(String[] args) {
        
        //oF = (9/5)*oC + 32 es la formula a implementar
        double celsius = 31;
        double fahrenheit = (9 / 5.0 * celsius) + 32;
        System.out.println("31 grados Celsius = " + fahrenheit 
                           + " grados Fahrenheit");
        System.out.println();
        
        System.out.println("Redondeando a centesimas tenemos ...");
        fahrenheit = Math.round(((9 / 5.0 * celsius) + 32) * 100) / 100.0; 
        System.out.println("31 grados Celsius son " + fahrenheit 
                           + " grados Fahrenheit");
        System.out.println("Y si, ademas, exigimos formato ... ");
        System.out.printf("31 grados Celsius = %.2f grados Fahrenheit\n", 
                           fahrenheit);
    }
}
