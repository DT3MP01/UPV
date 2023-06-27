
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
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        sc.useLocale(Locale.US);
        double num1;
        double num2;
        double num3;
        num1 = sc.nextDouble();
        num2 = sc.nextDouble();
        num3 = sc.nextDouble();
        double raiz = num2 * num2 - 4 * num1 * num3;
        double res1 = (-num2 + Math.sqrt(raiz)) / (2 * num1); 
        double res2 = (-num2 - Math.sqrt(raiz)) / (2 * num1);
        if (num1 == 0) {
            System.out.println("No es una ecuación de segundo grado");
        } else if (raiz < 0) {
            System.out.println("La ecuación da números imaginarios");
        } else {
            System.out.println("Primera solución: " + res1);
            System.out.println("Segunda solución: " + res2);
        }
    }
}
