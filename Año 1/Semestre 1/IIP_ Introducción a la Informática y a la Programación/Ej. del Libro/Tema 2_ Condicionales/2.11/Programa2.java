
/**
 * Write a description of class Programa2 here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
import java.util.Scanner;

public class Programa2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        int nota;
        nota = sc.nextInt();
        switch (nota) {
            case 0:
            case 1: 
            case 2: 
            case 3: 
            case 4:
                System.out.println("Insuficiente");
                break;
            case 5:
                System.out.println("Suficiente");
                break;
            case 6:
                System.out.println("Bien");
                break;
            case 7:
            case 8:
                System.out.println("Notable");
                break;
            case 9:
            case 10:
                System.out.println("Sobresaliente");
                break;
            default:
                System.out.println("Debe ser un número entero entre 0 y 10");
        }
    }
}