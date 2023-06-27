
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
        
        double min;
        double max;
        double num;
        
        System.out.println("Introduce el mínimo del rango");
        min = sc.nextDouble();
        System.out.println("Introduce el máximo del rango");
        max = sc.nextDouble();
        System.out.println("Introduce un número dentro del rango");
        num = sc.nextDouble();
        
        while (num >= min && num <= max) {
            System.out.println("Muy bien. Está dentro del rango");
            break;
        }
        
        while (num < min || num > max) {
            System.out.println("El valor no está dentro del rango, vuelve a introducirlo");
            num = sc.nextDouble();
        }
    }
}
