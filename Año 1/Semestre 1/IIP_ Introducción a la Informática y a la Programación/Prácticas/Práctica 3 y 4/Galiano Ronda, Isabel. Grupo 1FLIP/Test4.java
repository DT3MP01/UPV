package pract4;

import java.util.Scanner;

/**
 *  Clase Test4: programa que usa la clase TimeInstant para 
 *  mostrar por pantalla...
 * (a) dos instantes de tiempo en formato hh:mm; en concreto, 
 *     el primero es un instante cuyas componentes se han leido 
 *     de teclado y el segundo es el instante UTC actual
 *     
 * (b) el valor absoluto de la diferencia en minutos entre los 
 *     dos instantes indicadas en (a)
 *     
 * (c) Las horas y minutos equivalentes a el valor indicado en (b)
 *
 *  @author Mabel 
 *  @version Curso 2018-19
 */
 
public class Test4 { 
     
    public static void main(String[] args) {
        
        Scanner kbd = new Scanner(System.in);
        System.out.println("Lectura de teclado de una hora.");
        System.out.print("   -> Introduzca las horas (entre 0 y 23): ");
        int h = kbd.nextInt();
        System.out.print("   -> Introduzca los minutos (entre 0 y 59): ");
        int m = kbd.nextInt();
        
        // La ACTIVIDAD 4 de la Practica 3 es ahora:
        TimeInstant iUsuario = new TimeInstant(h, m);
        System.out.println("Instante introducido: " + iUsuario.toString()
                           + ".");
     
        
        // La ACTIVIDAD 5 de la Practica 3 es ahora:
        TimeInstant iUTC = new TimeInstant();
        System.out.println("Instante actual: " + iUTC.toString()
                           + "(tiempo UTC)");
        
        int difMinutos = Math.abs(iUsuario.compareTo(iUTC));
        System.out.println("La diferencia en minutos entre ambos instantes: " 
                           + difMinutos);
                           
        // Se queda como estaba en la Practica 3
        int horasDif = difMinutos / 60;
        // Cuantos minutos restan? 
        int minutosDif = difMinutos % 60;
        System.out.println("Que equivalen a: " + horasDif + " horas y " 
                           + minutosDif + " minutos.");
    }    
}