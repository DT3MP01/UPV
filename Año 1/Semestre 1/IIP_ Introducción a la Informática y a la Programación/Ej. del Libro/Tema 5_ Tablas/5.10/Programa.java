
/**
 * Write a description of class Programa here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
import java.util.Arrays;
import java.util.Scanner;

public class Programa {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        System.out.println("Introduce cuántos números quieres almacenar");
        
        int num;
        num = sc.nextInt();
        
        System.out.println("Introduce ahora los números que quieres que se almacenen");
        
        int t[];
        t = new int[num]; //tabla para los datos iniciales
        
        for (int i = 0; i < t.length; i++) {
            t[i] = sc.nextInt();
        }
        
        System.out.println("Los números impares almacenados son: ");
        System.out.println(Arrays.toString(soloImpares(t)));
        
        System.out.println("Los números pares almacenados son: ");
        System.out.println(Arrays.toString(soloPares(t)));
    }
    static int[] soloImpares (int tabla[]) {
        int numElem;
        numElem = tabla.length;
        
        int contImpar;
        contImpar = 0;
        
        for (int i = 0; i < numElem; i++) {
            if (tabla[i] % 2 != 0) {
               contImpar++;
            }
        }
        
        int copia[] = new int[contImpar];
        
        contImpar = 0;
        
        for (int i = 0; i < numElem; i++) {
            if (tabla[i] % 2 != 0) {
               copia[contImpar] = tabla[i];
               contImpar++;
            }
        }
        
        Arrays.sort(copia);
        
        return copia;
    }
    static int[] soloPares (int tabla[]) {
        int numElem;
        numElem = tabla.length;
        
        int contPar;
        contPar = 0;
        
        for (int i = 0; i < numElem; i++) {
            if (tabla[i] % 2 == 0) {
               contPar++;
            }
        }
        
        int copia[] = new int[contPar];
        
        contPar = 0;
        
        for (int i = 0; i < numElem; i++) {
            if (tabla[i] % 2 == 0) {
               copia[contPar] = tabla[i];
               contPar++;
            }
        }
        
        Arrays.sort(copia);
        
        return copia;
    }
}
