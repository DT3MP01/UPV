
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
       
       System.out.println("Introduce un número entre el 1 y el 7");
       
       int num;
       num = sc.nextInt();
      while (num < 1 || num > 7) {
           System.out.println("El número no es correcto, introdúcelo de nuevo");
           num = sc.nextInt();
      }
      switch (num) {
           case 1:
                System.out.println("lunes");
                break;
           case 2:
                System.out.println("martes");
           break;
           case 3:
                System.out.println("miércoles");
                break;
           case 4:
                System.out.println("jueves");
                break;
           case 5:
                System.out.println("viernes");
                break;
           case 6:
                System.out.println("sábado");
                break;
           case 7: 
                System.out.println("domingo");
                break;
      }
    }
}
