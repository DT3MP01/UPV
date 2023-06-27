
/**
 * Write a description of class Programa here.
 *
 * @David
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
        double num3;
        num1 = sc.nextDouble();
        num2 = sc.nextDouble();
        num3 = sc.nextDouble();
        
        if (num1 > num2 && num1 > num3) {
            if (num2 > num3) {
                System.out.println(num1 + ", " + num2 + ", " + num3);
            }
            else {
                System.out.println(num1 + ", " + num3 + ", " + num2);
            }
        } else if (num2 > num3 && num2 > num1) {
            if (num3 > num1) {
                System.out.println(num2 + ", " + num3 + ", " + num1);
            }
            else {
                System.out.println(num2 + ", " + num1 + ", " + num3);
            }
        } else if (num3 > num1 && num3 > num2) {
            if (num1 > num2) {
                System.out.println(num3 + ", " + num1 + ", " + num2);
            }
            else {
                System.out.println(num3 + ", " + num2 + ", " + num1);
            }
        }
    }
}