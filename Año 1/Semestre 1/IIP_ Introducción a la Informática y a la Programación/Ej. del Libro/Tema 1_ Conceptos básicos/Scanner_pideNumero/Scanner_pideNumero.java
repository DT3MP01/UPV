import java.util.Scanner;
import java.util.Locale;
/**
 *
 * @author davidarnalgarcia
 */
public class Scanner_pideNumero {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int num; //se guardará el número que se introduzca
        
        System.out.println("Escribe un número: "); //salida por consola
        Scanner sc = new Scanner(System.in);
        sc.useLocale(Locale.US); //Permite que el usuario introduzca un "."
        
        num = sc.nextInt(); //entrada por consola
        System.out.println("Valor introducido: " + num); //salida: mensaje + variable 
    }
}
