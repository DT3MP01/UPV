
/**
 * Write a description of class Programa here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
import java.util.Scanner;
public class Programa
{
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        double numero1;
        double numero2;
        numero1 = sc.nextDouble();
        numero2 = sc.nextDouble();
        if (numero2 != numero1) {
            numero2 = numero2;
        } else {
            System.out.println("No pueden ser dos números iguales. Escríbelo de nuevo");
            numero2 = sc.nextDouble();
        }
        
        if (numero2 > numero1) {
            System.out.println("El segundo número es mayor");
        } else { 
            System.out.println("El primer número es mayor");
        }
    }
}
