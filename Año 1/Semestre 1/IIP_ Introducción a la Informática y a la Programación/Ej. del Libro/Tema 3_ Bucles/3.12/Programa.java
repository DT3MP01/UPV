
/**
 * Write a description of class Programa2 here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
import java.util.Scanner;

public class Programa {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        System.out.println("Introduce las calificaciones de cinco alumnos");
        
        double cal;
        int cont = 0;
        
        for (int i = 1; i < 6; i++) {
            cal = sc.nextDouble();
            
            if (cal < 5) {
                System.out.println("Estás suspendido");
                cont++;
            }
        }
        
        System.out.println("Hay un total de " + cont + " suspensos");
    }
}
