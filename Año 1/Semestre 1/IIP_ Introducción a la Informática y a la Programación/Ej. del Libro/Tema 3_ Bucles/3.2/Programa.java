
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
        
        int edad, sumaEdades, contadorAlumnos, contadorMayorEdad;
        sumaEdades = 0;
        contadorAlumnos = 0;
        contadorMayorEdad = 0;
        System.out.println("Introduce la edad del alumno");
        edad = sc.nextInt();
        
        while (edad >= 0) {
            sumaEdades += edad;
            contadorAlumnos++;
            if (edad >= 18) {
                contadorMayorEdad++;
            }
            edad = sc.nextInt();
        }
        
        double mediaEdades;
        mediaEdades = (double) sumaEdades / contadorAlumnos;
        
        System.out.println("La suma de las edades es " + sumaEdades + " años" + ", la media de las edades es: " + mediaEdades + " años, además, se han contado " + contadorAlumnos + " alumnos y " + contadorMayorEdad + " eran mayores de edad.");
    }
}
