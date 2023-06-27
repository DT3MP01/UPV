
/**
 * Write a description of class Programa here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
import java.util.Scanner;

public class Programa {
   public static void main(String[] args) {
       Scanner sc = new Scanner(System.in);
       int n;
       n = sc.nextInt();
       int cuadrado = n * n;
       while (n != 0) {
         if (n % 2 == 0) {
             System.out.println("El número es par");
         } else { 
             System.out.println("El número es impar");
         }
         
         if (n >= 0) {
             System.out.println("El número es positivo");
         } else {
             System.out.println("El número es negativo");
         }
         System.out.println("El cuadrado del número es " + cuadrado);
         n = sc.nextInt();
       }
   }
}
