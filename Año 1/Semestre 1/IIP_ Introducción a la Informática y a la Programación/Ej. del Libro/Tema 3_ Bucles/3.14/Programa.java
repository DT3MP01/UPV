
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
    
      System.out.println("Introduce un número entero");
    
      int num;
      num = sc.nextInt();
      
      for (int i = 0; num > i; num--) {
          for (int j = num; j > 0; j--) {
              System.out.print("*");
          }
          System.out.println();
      }
   }
}
