package pract3;

import java.util.Scanner;

/**
 *  Clase Test3.
 *  Una primera clase con lectura de datos desde teclado, 
 *  y uso de operaciones con int, long, Math y String.
 *  
 *  @author Mabel 
 *  @version Curso 2018-19
 */
 
public class Test3 { 
     
    public static void main(String[] args) { 
        
        Scanner kbd = new Scanner(System.in);
        System.out.println("Lectura de teclado de una hora.");
        System.out.print("   -> Introduzca las horas (entre 0 y 23): ");
        int h = kbd.nextInt();
        System.out.print("   -> Introduzca los minutos (entre 0 y 59): ");
        int m = kbd.nextInt();
        
        // Actividad 4: Cambiar el formato de la hora a hh:mm
        // System.out.println("Hora introducida: " + h + " y " + m + ".");
        // Comprobar primero en el Code Pad 
        String hh = "0" + h;
        hh = hh.substring(hh.length() - 2); // Por que -2? 
        String mm = "0" + m;
        mm = mm.substring(mm.length() - 2); // Por que -2?
        System.out.println("Hora introducida: " + hh + ":" + mm + ".");
        
        // Actividad 5: Calculo de la hora UTC
        // Comprobar primero en el Code Pad
        // Como nos interesa saber la hora UTC de HOY, nos planteamos 
        // primero cuantos dias hay en System.currentTimeMillis() milisegundos 
        // Regla de tres: 1 dia  ---> 24h x 60' x 60" x 1000 milisegundos
        //                x dias ---> System.currentTimeMillis() milisegundos
        // int dias = (int) (System.currentTimeMillis() / (24 * 60 * 60 *1000)
        
        // Por tanto, el resto de esta division entera son los milisegundos   
        // que NO completan un dia, i.e. los milisegundos transcurridos desde  
        // que empezo el dia de HOY
        // NOTA: para acortar la longitud de las lineas de codigo lo maximo 
        // posible, usaremos la abreviatura de milisegundos en el Sistema 
        // Internacional, ms
        int msRestan = (int) (System.currentTimeMillis() % (24 * 60 * 60 * 1000));
        
        // Cuantas horas hay en esos milisegundos que restan (msRestan)? 
        // Regla de tres: 1 hora  ---> 60' x 60" x 1000 ms
        //                x horas ---> msRestan
        int hUTC = msRestan / (60 * 60 * 1000);
        
        // Por tanto, el resto de esta division entera son los milisegundos 
        // que NO completan una hora del dia de HOY 
        msRestan = msRestan % (60 * 60 * 1000);
        
        // Cuantos minutos hay en esos milisegundos que restan (msRestan)? 
        // Regla de tres: 1 minuto  ---> 60" x 1000 ms
        //                x minutos ---> msRestan
        int mUTC = msRestan / (60 * 1000);
        
        // Cambiar el formato a hhUTC:mmUTC
        String hhUTC = "0" + hUTC;
        hhUTC = hhUTC.substring(hhUTC.length() - 2); 
        String mmUTC = "0" + mUTC;
        mmUTC = mmUTC.substring(mmUTC.length() - 2);
        System.out.println("Hora actual: " + hhUTC + ":" 
                           + mmUTC + "(tiempo UTC)");
        
        // Mostrar por pantalla con el formato que se indica 
        // en el boletin... 
        // (a) El valor absoluto de la dif. en minutos entre
        //     la hora introducida por el usuario y la hora UTC 
        // (b) Las horas y minutos a los que equivale esa dif.
        // PASO 1: pasar a minutos tanto h como horas y 
        //         sumarlo a, respectivamente, m y minutos
        int minutosUsuario = m + h * 60;
        int minutosUTC = mUTC + hUTC * 60;
        // PASO 2: calcular el valor absoluto de su diferencia
        int difMinutos = Math.abs(minutosUsuario - minutosUTC);
        // PASO 3: mostrar por pantalla difMinutos
        // Primero, calcular cuantas horas hay en difMinutos? 
        // Regla de tres: 1 hora  ---> 60'
        //                x horas ---> difMinutos
        int horasDif = difMinutos / 60;
        // Cuantos minutos restan? 
        int minutosDif = difMinutos % 60;
        System.out.println("La diferencia en minutos entre ambas horas: " 
                           + difMinutos + " (" + horasDif + " hor. y " 
                           + minutosDif + " min.)");
    }    
}