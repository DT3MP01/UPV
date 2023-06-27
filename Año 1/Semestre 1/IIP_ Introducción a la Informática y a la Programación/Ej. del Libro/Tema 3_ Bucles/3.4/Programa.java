
/**
 * Write a description of class Programa here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
import java.util.Scanner;

public class Programa {
    public static void main(String[] args) {
        Scanner sc = new  Scanner(System.in);
        
        int num;
        System.out.println("Bienvenido. En el día de hoy, vamos a aprender a contar");
        System.out.println("Introduce un número n y aparecerán todos los números del 1 a n");
        num = sc.nextInt();
        int i;
        for (i = 1; i <= num; i++) {
           System.out.println(i); 
        }
    }
}