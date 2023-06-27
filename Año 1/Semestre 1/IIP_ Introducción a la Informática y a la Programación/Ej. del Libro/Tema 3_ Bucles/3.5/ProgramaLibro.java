
/**
 * Write a description of class ProgramaLibro here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
import java.util.Scanner;
import java.util.Locale;

public class ProgramaLibro {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        sc.useLocale(Locale.US);
        
        double min;
        double max;
        double num;
        
        System.out.println("Introduce el mínimo del rango");
        min = sc.nextDouble();
        System.out.println("Introduce el máximo del rango");
        max = sc.nextDouble();
        
        do {
            System.out.println("Introduce un número dentro del rango");
            num = sc.nextDouble(); 
        } while (!(num >= min && num <= max));
        
        System.out.println("Muy bien, el número pertenece al rango");
    }
}
