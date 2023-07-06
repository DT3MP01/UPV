package updateSolEda;

 

import librerias.estructurasDeDatos.modelos.Map; 
import librerias.estructurasDeDatos.modelos.ListaConPI;
import librerias.estructurasDeDatos.deDispersion.TablaHash; 
import java.util.Locale; 
import java.util.Scanner; 

/** Ejercicio 1, Tema 3-S1: Test2Map es un programa que lee un texto de 
 *  teclado y muestra por pantalla la talla del vocabulario del texto, 
 *  o numero de palabras distintas que contiene.
 */

public class Test2Map {
    
    public static void main(String[] args) {
        // Lectura de la frase (String) a partir de la que se construye el Map
        // Por ejemplo: "Se me ha olvidado escribir palabras repetidas vaya!! vaya!!"
        Locale localEDA = new Locale("es", "US");
        Scanner teclado = new Scanner(System.in).useLocale(localEDA);
        System.out.println("Escribe texto (palabras separadas por blancos):");
        String texto = teclado.nextLine();
            
        // Creacion del Map vacio:
        librerias.estructurasDeDatos.modelos.Map<String, String> m = 
            new TablaHash<String, String>(texto.length());
        // ?Que pasaria si en lugar de librerias.estructurasDeDatos.modelos.Map 
        // escribes Map?
            
        // Construccion del Map, a partir de la frase leida: 
        // uso del metodo split de String con separador " " (uno o mas)
        String[] palabrasDelTexto = texto.split(" +");
        for (int i = 0; i < palabrasDelTexto.length; i++) {
            String palabra = palabrasDelTexto[i].toLowerCase();
            m.insertar(palabra, palabra);
        }
            
        // UNICA DIFERENCIA CON RESPECTO A Test1Map: 
        // nos piden SOLO el numero de palabras distintas  
        System.out.println("Numero de palabras distintas en el texto, "
                           + "o talla del Map " + m.talla());
    }
}