
/**
 * Write a description of class Programa here.
 *
 * @David
 * @version (a version number or a date)
 */
import java.util.Scanner;

public class Programa {
       public static void main(String[] args) {
         Scanner sc = new Scanner(System.in);
         
         System.out.println("¿Cuántos números desea introducir?");
         
         int num;
         num = sc.nextInt();
         int t[] = new int[num];
         System.out.println("Excelente. Introdúzcalos");
         
         for (int i = 0; i < t.length; i++) {
             t[i] = sc.nextInt();
         }
         
         for (int i = t.length - 1; i > -1; i--) {
             System.out.println(t[i]);
         }
     }
}
