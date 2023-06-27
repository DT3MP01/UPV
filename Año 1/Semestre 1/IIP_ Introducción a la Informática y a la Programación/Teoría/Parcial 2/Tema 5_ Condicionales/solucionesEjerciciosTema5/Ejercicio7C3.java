import java.util.Locale;
/**
 * Clase Ejercicio7C3: Programa con el codigo asociado al ejercicio 7
 * del Capitulo 3 del libro de la asignatura
 * 
 * @author Libro IIP-PRG
 * @version 2015-2016
 */

public class Ejercicio7C3 {
    
    public static void main(String[] args) {
        
        double r = 4;
        double s = 4 * Math.PI * r  * r;
        double v = 4 / 3.0 * Math.PI * Math.pow(r, 3);
        System.out.println("Superficie de esfera de radio " + r + "=" + s);
        System.out.println("Volumen de esfera de radio " + r + " = " + v);
        System.out.println();
        
        v = s * r / 3;
        System.out.println("Volumen de esfera de radio " + r 
                          + ", calculado a partir de su superficie, es " + v);
        System.out.println();
        
        System.out.println("Redondeando a milesimas tenemos ...");
        s = Math.round(4  * Math.PI * r * r * 1000) / 1000.0;
        v = Math.round(4 / 3.0 * Math.PI * Math.pow(r, 3) * 1000) / 1000.0;
        System.out.println("Superficie de esfera de radio " + r + " = " + s);
        System.out.println("Volumen de esfera de radio " + r  + " = " + v);
        System.out.println();
        
        System.out.println("Y si, ademas, exigimos formato ... ");
        System.out.printf(Locale.US, 
                          "Superficie de esfera de radio %1.1f = %.3f\n", r, s);
        System.out.printf("Volumen de esfera de radio %1.1f = %.3f\n", r, v);
        System.out.println();
    }
}


