/**
 * Clase TestOperador: Programa con el codigo asociado al ejercicio 9
 * del Capitulo 3 del libro de la asignatura
 * @author Libro IIP-PRG
 * @version 2016-2017
 */
public class TestOperador {
    
    public static void main(String[] args) {
        
        int a = 12, b = 8, c = 6;
        System.out.println(a + " " + b + " " + c);
        
        a = c;
        System.out.println(a + " " + b + " " + c);
        
        c += b; // equivale a c = c + b;
        System.out.println(a + " " + b + " " + c);
        
        a = b + c;
        System.out.println(a + " " + b + " " + c);
        
        a++;
        b++;
        System.out.println(a + " " + b + " " + c);
        
        c = a++ + ++b;
        System.out.println(a + " " + b + " " + c);
        System.out.println("Por que se obtiene este resultado?");
    }
}