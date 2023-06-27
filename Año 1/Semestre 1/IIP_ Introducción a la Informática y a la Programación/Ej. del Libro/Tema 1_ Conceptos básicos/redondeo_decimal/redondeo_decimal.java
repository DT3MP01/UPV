
/**
 * Write a description of class redondeo_decimal here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */

import java.util.Scanner;
import java.util.Locale;

public class redondeo_decimal
{
   public static void main(String [] args) {
       double num;
       int redondeo;
       Scanner sc = new Scanner(System.in);
       sc.useLocale(Locale.US);
       
       System.out.println("Escribe un número decimal (con punto): ");
       num = sc.nextDouble();
       redondeo = (int) (num + 0.5);
       
       System.out.println(num + " redondeando es: " + redondeo);
    }
}
