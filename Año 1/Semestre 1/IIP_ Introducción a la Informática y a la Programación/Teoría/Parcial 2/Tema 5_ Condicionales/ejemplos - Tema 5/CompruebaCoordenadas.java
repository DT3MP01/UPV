import java.util.Scanner;
import java.util.Locale;

/**
 * Clase Programa que lee las coordenadas (double) de un punto  
 * y muestra por pantalla su posicion en el plano
 * 
 * @version Octubre 2017
 */

public class CompruebaCoordenadas {

    public static void main(String[] args) { 
        Scanner sc = new Scanner(System.in);
        sc.useLocale(Locale.US);
        System.out.println("Introduce la coordenada x del Punto");
        double x = sc.nextDouble();
        System.out.println("Introduce la coordenada y del Punto");
        double y = sc.nextDouble();
        System.out.print("El punto está en ");
        if (x == 0) {
            if (y == 0) { System.out.println("el origen de coordenadas"); } 
            else { System.out.println("el eje de ordenadas"); }
        } else {
            if (y == 0) { System.out.println("el eje de abscisas"); }
            else { System.out.println("cualquiera de los 4 cuadrantes"); }
        }
    }
}