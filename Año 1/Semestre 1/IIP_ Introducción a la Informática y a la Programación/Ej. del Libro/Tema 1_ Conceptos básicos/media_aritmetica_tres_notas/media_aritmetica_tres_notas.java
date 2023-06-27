import java.util.Scanner;
import java.util.Locale;

public class media_aritmetica_tres_notas
{
   public static void main(String[] args) {
       double nota1;
       double nota2;
       double nota3;
       double media_aritmetica;
       Scanner sc = new Scanner(System.in);
       sc.useLocale(Locale.US);
       
       System.out.println("Escribe tu primera nota: ");
       nota1 = sc.nextDouble();
       System.out.println("Escribe tu segunda nota: ");
       nota2 = sc.nextDouble();
       System.out.println("Escribe tu tercera nota: ");
       nota3 = sc.nextDouble();
       
       media_aritmetica = (int) (nota1 + nota2 + nota3) / 3;
       
       System.out.println("Tu nota media es: " + media_aritmetica);
    }
}

