
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
        
        System.out.println("Introduce un número entre el 1 y el 10");
        
        int num;
        num = sc.nextInt();
        
        if (num > 0 && num < 11) {
          for (int i = 0; i < 11; i++) {
              System.out.println(i * num);
          }
        } else {
          System.out.println("El número que has introducido no está entre el 1 y el 10");
        }
    }
}
