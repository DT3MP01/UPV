
/**
 * Write a description of class Programa here.
 *
 * @David
 * @version (a version number or a date)
 */
import java.util.Scanner;
import java.util.Locale;

public class Programa {
   public static void main(String[] args) {
       Scanner sc = new Scanner(System.in);
       sc.useLocale(Locale.US);
       
       int dm;
       int um;
       int c;
       int d;
       int u;
       int num;
       System.out.println("Introduce un número del 0 al 99.999");
       
       num = sc.nextInt();
       
       u = num % 10;
       num = num / 10;
       
       d = num % 10;
       num = num / 10;
       
       c = num % 10;
       num = num / 10;
       
       um = num % 10;
       num = num / 10;
       
       dm = num;
       
       if (dm == 0 && um != 0 && um == u && d == c) {
               System.out.println("El número es capicúa");
       } else if (dm == 0 && um == 0 && c != 0 && c == u) {
               System.out.println("El número es capicúa");
       } else if (dm == 0 && um == 0 && c == 0 && d != 0 && d == u) {
               System.out.println("El número es capicúa");
       } else if (dm != 0 && dm == u && um == d) {
               System.out.println("El número es capicúa");
       } else {
               System.out.println("El número no es capicúa");
       }
    }
}
