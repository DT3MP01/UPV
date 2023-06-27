
/**
 * Write a description of class Programa here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
import java.util.Scanner;
public class Programa
{
    // instance variables - replace the example below with your own
    public static void main(String[] args) {
    int numero1;
    int numero2;
    Scanner sc = new Scanner(System.in);
    numero1 = sc.nextInt();
    numero2 = sc.nextInt();
    
    if (numero1 == numero2) {
        System.out.println("El primer número y el segundo son iguales");
    } else {
        System.out.println("Los números no son iguales");
    } 
  }
}
