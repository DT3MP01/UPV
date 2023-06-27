
/**
 * Write a description of class Programa here.
 *
 * David
 * @version (a version number or a date)
 */
import java.util.Scanner;

public class Programa {
    public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    
    int dia, mes, año;
    System.out.println("Introduce el día");
    dia = sc.nextInt();
    System.out.println("Introduce el mes");
    mes = sc.nextInt();
    System.out.println("Introduce el año");
    año = sc.nextInt();
    
    if (año < 0) {
        System.out.println("La fecha no es correcta");
    } else if (dia > 28 && mes == 2) {
        System.out.println("La fecha no es correcta");
    } else if (dia > 30 && (mes == 4 || mes == 6 || mes == 9 || mes == 11)) {
        System.out.println("La fecha no es correcta");
    } else if (dia > 31 && (mes == 1 || mes == 3 || mes == 5 || mes == 7 || mes == 8 || mes == 9 || mes != 10 || mes != 12)) {
        System.out.println("La fecha no es correcta");
    } else if (dia > 0 && mes <= 12) {
        System.out.println("La fecha es correcta y es: " + dia + "/" + mes + "/" + año);
    } else {
        System.out.println("La fecha no es correcta");
    }
  }
}
