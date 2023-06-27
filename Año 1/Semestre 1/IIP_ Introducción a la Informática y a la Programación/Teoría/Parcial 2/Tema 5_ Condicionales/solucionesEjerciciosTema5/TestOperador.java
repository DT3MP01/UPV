
/**
 * Clase TestOperador: Programa con el codigo asociado al ejercicio 9
 * del Capitulo 3 del libro de la asignatura
 * 
 * @author Libro IIP-PRG
 * @version 2015-2016
 */
public class TestOperador {
    
    public static void main(String[] args) {
        
        int a = 12, b = 8, c = 6;
        System.out.println(a + " " + b + " " + c);
        
        a = c;
        System.out.println(a + " " + b + " " + c);
        
        c += b; // equivale a la instruccion c = c + b;
        System.out.println(a + " " + b + " " + c); 
        
        a = b + c;
        System.out.println(a + " " + b + " " + c);
        
        a++; // equivale a la instruccion a = a + 1;
        b++; // equivale a a la instruccion b = b + 1;
        System.out.println(a + " " + b + " " + c);
        
        c = a++ + ++b; // equivale a la secuencia c = a + (b + 1); a++;
        System.out.println(a + " " + b + " " + c);
        System.out.println("Por que se obtiene este resultado?");
    }
}
