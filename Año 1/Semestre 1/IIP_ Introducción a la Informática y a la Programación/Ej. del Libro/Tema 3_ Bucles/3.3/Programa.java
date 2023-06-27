
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
        
        System.out.println("Bienvenido, en este juego se trata de adivinar un número entre el 1 y el 100.");
        System.out.println("Si introduces el número -1, podrás salir del juego y contará como si te hubieras rendido. Buena suerte");
        int num;
        num = sc.nextInt();
        int secret;
        secret = (int) (Math.random() * 100 + 1);
        
        while (num != secret && num != -1) {
            if (num > secret) {
                System.out.println("El número que has introducido es mayor que el número secreto");
            } else if (num < secret) {
                System.out.println("El número que has introducido es menor que el número secreto");
            }
            num = sc.nextInt();
        }
        if (num == -1) {
                System.out.println("Muy bien, gracias por haber jugado");
        } else {
                System.out.println("¡¡Has adivinado el número, felicidades!!");
        }
    }
}
