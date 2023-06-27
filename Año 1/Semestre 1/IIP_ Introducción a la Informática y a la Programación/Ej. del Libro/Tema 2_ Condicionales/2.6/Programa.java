
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
        double num1;
        double num2;
        num1 = sc.nextDouble();
        num2 = sc.nextDouble();
        
        if (num1 > num2) {
            System.out.println(num2 + ", " + num1);
        } else if (num1 == num2) {
            System.out.println("Ambos números son iguales");
        }
        else {
            System.out.println(num1 + ", " + num2);
        }
    }
}
