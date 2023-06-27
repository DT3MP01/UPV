
/**
 * Write a description of class Programa here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
import java.util.Scanner;
import java.util.Arrays;

public class Programa {
  public static void main(String[] args) {
      Scanner sc = new Scanner(System.in);
       
      int puntos[] = new int[8];
       
      System.out.println("Introduce la puntuación de los 5 programadores");
       
      for (int i = 0; i < 5; i++) {
           puntos[i] = sc.nextInt();
      }
       
      System.out.println("La puntuación ordenada de los programadores es: ");
       
      Arrays.sort(puntos, 0, 5);
      
      int numElem;
      numElem = 5;
       
      System.out.println("La tabla ordenada quedaría de la siguiente manera: ");

      for (int j = 0; j < numElem; j++) {
           System.out.println(puntos[j]);
      }
       
      System.out.println("Pueden participar hasta tres programadores de exhibición. Puedes añadir sus puntuaciones y cuando ya no haya que añadir más, habrá que introducir un número negativo");
       
      int exhib;
      exhib = sc.nextInt();
      
      int cont;
      cont = 0;
       
      int cont2;
      cont2 = 5;
      
      if (exhib > -1) {
           for (int k = 5; exhib > -1 && cont < 3; k++) {
               puntos[k] = exhib;
               cont++;
               cont2++;
               if (cont < 3) {
                   exhib = sc.nextInt();
               }
           }
      }
       
      System.out.println("Finalmente, la puntuación ordenada es: ");
       
      Arrays.sort(puntos, 0, cont2);
       
      for (int z = 0; z < cont2; z++) {
          System.out.println(puntos[z]);
      }
   }
}
