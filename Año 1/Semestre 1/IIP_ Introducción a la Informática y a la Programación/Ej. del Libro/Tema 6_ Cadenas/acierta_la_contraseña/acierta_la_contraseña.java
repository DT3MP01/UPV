
/**
 * Write a description of class acierta_la_contraseña here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */

/*
 Ejercicio 6.2. Diseñar el juego ACIERTA LA CONTRASEÑA. La mecánica del juego es
 la siguiente: el primer jugador introduce la contraseña; a continuación, el 
 segundo jugador debe teclear palabras hasta que la acierte. Realizar dos
 versiones; en la primera, las únicas pistas que se proporcionan son el
 número de caracteres y cuáles son el primer y el último carácter de la
 contraseña. En la segunda versión se facilita el juego indicando si la palabra
 introducida es mayor o menor, alfabéticamente, que la contraseña.
 */

import java.util.Scanner;

public class acierta_la_contraseña
{
    public static void main(String [] args) {
        Scanner sc = new Scanner(System.in);
        String contraseña;
        String texto_jugador2;
        System.out.println("Introduce la contraseña");
        
        //leemos la contraseña introducida
        contraseña = sc.nextLine();
        
        //Le damos la longitud de la contraseña al jugador 2
        int longitud;
        longitud = contraseña.length();
        System.out.println("La contraseña tiene una longitud de : " + longitud);
        
        //Le damos la primera letra de la contraseña al jugador 2
        char a = contraseña.charAt(0);
        System.out.println("La contraseña empieza con el carácter: " + a);
        
        //Le damos la última letra de la contraseña al jugador 2
        char b = contraseña.charAt(longitud - 1);
        System.out.println("La contraseña termina con el carácter: " + b);
        
        System.out.println("Ahora debes adivinarla");
        
        //Procedemos a que el usuario intente adivinar la contraseña
        texto_jugador2 = sc.nextLine();
        boolean iguales;
        if (iguales = texto_jugador2.equals(contraseña)) {
            System.out.println("¡¡Enhorabuena, lo has adivinado!!");
        }
        else {
            System.out.println("Lo siento, te has equivocado :(");
        }
        
    }
}