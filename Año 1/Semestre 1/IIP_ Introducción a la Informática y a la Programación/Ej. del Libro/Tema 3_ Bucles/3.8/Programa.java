
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
        
        num = sc.nextInt();
        
        int fact = 1;
        
        for (int i = num; i > 1; i--) {
            fact *= i;
        }
        
        System.out.println(fact);
    }
}
