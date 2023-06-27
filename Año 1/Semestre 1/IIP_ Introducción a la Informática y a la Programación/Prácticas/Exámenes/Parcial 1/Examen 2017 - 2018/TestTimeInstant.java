package examExample;

import java.util.Scanner;
/**
 * Clase TestTimeInstant. 
 * 
 * @author IIP. Grado en Informatica. ETSINF, UPV 
 * @version Curso 2018-19
 */
public class TestTimeInstant {
    
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        System.out.println("Lectura de teclado de una hora.");
        System.out.print("   -> Introduzca las horas (entre 0 y 23): ");
        int h = teclado.nextInt();
        System.out.print("   -> Introduzca los minutos (entre 0 y 59): ");
        int m = teclado.nextInt();
        TimeInstant ti;
        /* COMPLETAR */
        System.out.println("Despues: " + ti);
    }
}