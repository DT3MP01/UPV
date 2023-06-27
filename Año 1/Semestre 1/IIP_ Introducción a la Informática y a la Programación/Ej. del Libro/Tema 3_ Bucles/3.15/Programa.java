
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
        
        int num;
        
        System.out.println("Escribe un número natural");
        
        num = sc.nextInt();
        
        int num2; 
        num2 = num - 1;
        
        while (num % num2 != 0) {
            num2--;
        }
        
        if (num2 == 1) {
            System.out.println("El número es primo");
        } else {
            System.out.println("El número no es primo");
        }
    }
}
