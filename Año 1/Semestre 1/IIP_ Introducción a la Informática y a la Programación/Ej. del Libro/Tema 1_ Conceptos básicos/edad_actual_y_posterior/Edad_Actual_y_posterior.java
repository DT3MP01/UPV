import java.util.Scanner;
import java.util.Locale;

/**
 *
 * @author davidarnalgarcia
 */
public class Edad_Actual_y_posterior {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int edad;
        Scanner sc = new Scanner(System.in);
        System.out.println("Escriba su edad: ");
        
        edad = sc.nextInt();
        edad ++;
        System.out.println("El próximo año tendrá: " + edad);
    }
    
}
