
/**
 * Write a description of class media_aritmetica_dos_notas here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
import java.util.Scanner;
import java.util.Locale;

public class media_aritmetica_dos_notas
{
   public static void main(String[] args) {
       double nota1;
       double nota2;
       double media_aritmetica;
       Scanner sc = new Scanner (System.in);
       sc.useLocale(Locale.US);
       
       System.out.println("Escribe tu primera nota: ");
       nota1 = sc.nextDouble();
       System.out.println("Escribe tu segunda nota: ");
       nota2 = sc.nextDouble();
       
       media_aritmetica = (nota1 + nota2) / 2;
       
       System.out.println("Tu nota media es: " + media_aritmetica);
    }
}
