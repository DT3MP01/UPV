
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
    
    System.out.println("Bienvenido a la cámara secreta. Deberás adivinar el código correcto para abrir la cámara.");
    
    System.out.println("Elige la dificultad del juego. ¿Cuántos códigos quieres que tenga?");
    
    int digitos;
    digitos = sc.nextInt();
    
    int t[] = new int[digitos];
    
    for (int i = 0; i < t.length; i++) {
        t[i] = (int) (Math.random() * 9);
        t[i]++;
    }
    
    System.out.println("Introduce los números de la cámara");
    
    int t1[] = new int[digitos];
    
    for (int i = 0; i < t1.length; i++) {
        t1[i] = sc.nextInt();
        
        if (t[i] > t1[i]) {
            while (t[i] > t1[i]) {
                System.out.println("El código de la cámara es mayor. Vuelve a introducirlo");
                t1[i] = sc.nextInt();
            }
        } else {
            while (t[i] < t1[i]) {
                System.out.println("El código de la cámara es menor. Vuelve a introducirlo");
                t1[i] = sc.nextInt();
            }
        }
        if (i < t.length - 1) {
                System.out.println("Este número es correcto");
                System.out.println("Introduce el siguiente código");
        }
    }
    
    System.out.println("¡¡Enhorabuena, lo has averiguado!!");
  }
}
