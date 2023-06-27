
/**
 * Write a description of class Programa here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
import java.util.Scanner;
import java.util.Locale;

public class Programa {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        sc.useLocale(Locale.US);
        
        int num = sc.nextInt();
        if (num < 10) {
            System.out.println("El número tiene 1 cifra");
        } else if (num < 100) {
            System.out.println("El número tiene 2 cifras");
        } else if (num < 1000) {
            System.out.println("El número tiene 3 cifras");
        } else if (num < 10000) {
            System.out.println("El número tiene 4 cifras");
        } else if (num < 100000) {
            System.out.println("El número tiene 5 cifras");
        } else {
            System.out.println("No se puede evaluar cuántas cifras tiene el número");
        }
    }
}
