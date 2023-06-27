
/**
 * Write a description of class ProgramaLibro here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
import java.util.Scanner;

public class ProgramaLibro {
   public static void main(String[] args) {
       Scanner sc = new Scanner(System.in);
       
       int horas, minutos, segundos;
       String hora;
       
       System.out.println("Escribe las horas");
       horas = sc.nextInt();
       System.out.println("Escribe los minutos");
       minutos = sc.nextInt();
       System.out.println("Escribe los segundos");
       segundos = sc.nextInt();
       
       segundos++;
       
       if (segundos > 59) {
           segundos = 0;
           minutos++;
           if (minutos > 59) {
               minutos = 0;
               horas++;
               if (horas > 23) {
                   horas = 0;
                }
            }
        }
        System.out.println("Hora + 1 segundo: " + horas + ":" + minutos + ":" + segundos);
    }
}
