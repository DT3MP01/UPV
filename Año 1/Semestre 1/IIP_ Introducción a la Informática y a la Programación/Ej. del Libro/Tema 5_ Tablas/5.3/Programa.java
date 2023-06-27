
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
       
       System.out.println("¿Cuántos números desea introducir?");
       
       int num;
       num = sc.nextInt();
       
       int cont = 0;
       int cont2 = 0;
       int contnegativo = 0;
       int contnegativo2 = 0;
       int cont0 = 0;
       
       System.out.println("Muy bien, introdúzcalos");
       
       int t[] = new int[num];
       
       for (int i = 0; i < t.length; i++) {
           t[i] = sc.nextInt();
           if (t[i] > 0) {
               cont += t[i];
               cont2++;
           }
           
           if (t[i] < 0) {
               contnegativo += t[i];
               contnegativo2++;
           }
           
           if (t[i] == 0) {
               cont0++;
           }
       }
       
       System.out.println("La media aritmética de los números positivos es: " + (double) cont / cont2);
       
       System.out.println("La media aritmética de los números negativos es: " + (double) contnegativo / contnegativo2);
       
       System.out.println("El número de 0s que has introducido es: " + cont0);
   }
}
