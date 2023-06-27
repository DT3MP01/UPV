
/**
 * Write a description of class calculo_edad_usuario here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
import java.util.Scanner;
import java.util.Locale;

public class calculo_edad_usuario
{
    public static void main(String[] args) {
        int aActual;
        int aNacimiento;
        int edad;
        Scanner sc = new Scanner(System.in);
        sc.useLocale(Locale.US);
        
        //leemos los datos
        System.out.println("Escribe tu año de nacimiento: ");
        aNacimiento = sc.nextInt();
        System.out.println("Escribe el año actual: ");
        aActual = sc.nextInt();
        
        edad = aActual - aNacimiento;
        
        System.out.println("Tu edad actual es: " + edad + " años");
    }
}
