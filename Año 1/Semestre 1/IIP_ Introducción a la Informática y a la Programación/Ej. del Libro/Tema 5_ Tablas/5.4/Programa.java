
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
        
        int t[] = {7, 10, 15, 21, 28, 42};
        
        System.out.println("Mi tabla favorita contiene los números:");
        
        for (int i = 0; i < t.length; i++) {
            System.out.println(t[i]);
        }
        
        System.out.println("Indica el índice del número (el primero es el 0) que desees borrar (se borrarán todos los de después también)");
        
        int indice;
        indice = sc.nextInt();
        
        int numElem;
        numElem = t.length;
        
        while (numElem > indice) {
           if (indice > -1) {
               for (int j = indice; j < numElem - 1; j++) {
                   t[j] = t[j + 1];
               }
               numElem--;
           } else {
               System.out.println("Introduce un índice mayor o igual a 0");
               indice = sc.nextInt();
           }
        }
        
        System.out.println("La tabla se quedaría así: ");
        
        for (int k = 0; k < numElem; k++) {
            System.out.println(t[k]);
        }
    }
}
