
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
       
       int horas, minutos, segundos;
       String hora;
       
       System.out.println("Escribe las horas");
       horas = sc.nextInt();
       System.out.println("Escribe los minutos");
       minutos = sc.nextInt();
       System.out.println("Escribe los segundos");
       segundos = sc.nextInt();
       hora = horas + "/" + minutos + "/" + segundos;
       
       if (horas > 23) {
           System.out.println("La hora no es correcta");
       } else if (horas == 23) {
           if (minutos == 59) {
               if (segundos == 59) {
                   horas = 0;
                   minutos = 0;
                   segundos = 0;
                   hora = horas + "/" + minutos + "/" + segundos;
                   System.out.println(hora);
               }
           }
       } else if (minutos == 59) {
           if (segundos == 59) {
               horas++;
               minutos = 0;
               segundos = 0;
               hora = horas + "/" + minutos + "/" + segundos;
               System.out.println(hora);
           }
       } else if (segundos == 59) {
           minutos++;
           segundos = 0;
           hora = horas + "/" + minutos + "/" + segundos;
           System.out.println(hora);
       } else if (horas >= 0 && minutos >= 0 && segundos >= 0 && horas < 23 && minutos < 59 && segundos < 59) {
           segundos++;
           hora = horas + "/" + minutos + "/" + segundos;
           System.out.println(hora);
       } else {
           System.out.println("La hora no es correcta");
       }
    }
}
