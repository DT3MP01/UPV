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
        
        final int NUM_ALUM = 5;
        
        int c1[] = new int[NUM_ALUM]; //clase
        
        double T1[] = new double[NUM_ALUM]; //trimestre 1
        double T2[] = new double[NUM_ALUM]; //trimestre 2
        double T3[] = new double[NUM_ALUM]; //trimestre 3
        
        System.out.println("Introduce la nota del primer trimestre del grupo: ");
        leerNotas(T1);
        
        System.out.println("Introduce la nota del segundo trimestre del grupo: ");
        leerNotas(T2);
        
        System.out.println("Introduce la nota del tercer trimestre del grupo: ");
        leerNotas(T3);
        
        System.out.println("La nota media del trimestre 1 es: " + sumaNota(T1));
        
        System.out.println("La nota media del trimestre 2 es: " + sumaNota(T2));
        
        System.out.println("La nota media del trimestre 3 es: " + sumaNota(T3));
        
        System.out.println("Ahora indica la media del alumno que quieras sacar");
        
        int pos = sc.nextInt();
        
        if (pos > -1 && pos < 6) {
           System.out.println("Su nota media es: " + ((double) ((T1[pos] + T2[pos] + T3[pos]) / 3))); 
        } else {
            System.out.println("El rango de alumnos va del 0 - 5, introduce uno de esos números");
            pos = sc.nextInt();
            while (pos < 0 || pos > 5) {
                pos = sc.nextInt();
                if (pos < 0 || pos > 5) {
                   System.out.println("El rango de alumnos va del 0 - 5, introduce uno de esos números");
                }
            }
            System.out.println("Su nota media es: " + ((double) ((T1[pos] + T2[pos] + T3[pos]) / 3)));
        }
     }
     static void leerNotas(double c[]) {
        for (int i = 0; i < c.length; i++) {
            Scanner sc = new Scanner(System.in);
            
            System.out.println("Nota del alumno " + i + ":");
            c[i] = sc.nextDouble();
        }
     }
     static double sumaNota(double c[]) {
        double a = 0;
        for (int i = 0; i < c.length; i++) {
            a += c[i];
        }
        return a/c.length;
     }
}
