
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
       int dia, mes, año;
       String fecha;
       
       System.out.println("Introduce el día");
       dia = sc.nextInt();
       System.out.println("Introduce el mes");
       mes = sc.nextInt();
       System.out.println("Introduce el año");
       año = sc.nextInt();
       fecha = dia + "/" + mes + "/" + año;
       
       if (año == 0) {
           System.out.println("La fecha no es correcta");
        } else if (mes == 2) {
           if (dia > 0 && dia <= 28) {
               System.out.println("La fecha es correcta y es " + fecha);
           } else {
               System.out.println("La fecha no es correcta");
           }
       } else if (mes == 4 || mes == 6 || mes == 9 || mes == 11) {
           if (dia > 0 && dia <= 30) {
               System.out.println("La fecha es correcta y es " + fecha);
           } else {
               System.out.println("La fecha no es correcta");
           }
       } else if (mes > 0 && mes <= 12) { 
           if (dia > 0 && dia <= 31) {
               System.out.println("La fecha es correcta y es " + fecha);
           } else {
               System.out.println("La fecha no es correcta");
           }
       } else {
               System.out.println("La fecha no es correcta");
       }
    }
}
