
/**
 * Write a description of class Programa here.
 *
 * @David
 * @version (a version number or a date)
 */
import java.util.Scanner;

public class Programa {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        double etiquetaArbolMasAlto, alturaArbolMasAlto;
        
        double altura;
        double etiqueta = 0;
        System.out.println("Introduce la altura del árbol");
        
        altura = sc.nextInt();
        alturaArbolMasAlto = altura;
        etiquetaArbolMasAlto = 0;
        
        while (altura != -1) {
           if (altura > alturaArbolMasAlto) {
            alturaArbolMasAlto = altura;
            etiquetaArbolMasAlto = etiqueta;
           }
           etiqueta++;
           System.out.println("Altura del árbol (" + etiqueta + "): ");
           altura = sc.nextInt();
        }
        
        if (alturaArbolMasAlto == -1) {
            System.out.println("No hay ningún árbol");
        } else {
            System.out.println("El árbol más alto mide: " + alturaArbolMasAlto);
            System.out.println("Corresponde al árbol con etiqueta:" + etiquetaArbolMasAlto);
        }
    }
}