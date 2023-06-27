
/**
 * Write a description of class Programa here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
import java.util.Scanner;
import java.util.Locale;
public class Programa
{
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        sc.useLocale(Locale.US);
        double numero1;
        numero1 = sc.nextDouble();
        
        if (numero1 > -1 && numero1 < 1 && numero1 != 0) {
        // if (-1 < numero1 && numero1 < 1 && numero1 != 0) {
            System.out.println("Es un número casi-cero");
        } else {
            System.out.println("El número no es casi-cero");
        }
    }
}
