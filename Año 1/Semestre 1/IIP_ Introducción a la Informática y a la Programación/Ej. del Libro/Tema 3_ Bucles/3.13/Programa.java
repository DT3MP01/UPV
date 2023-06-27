
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
      
      double nota;
      int cont1, cont2, cont3;
      cont1 = 0;
      cont2 = 0;
      cont3 = 0;
      
      for (int i = 0; i < 6; i++) {
          nota = sc.nextDouble();
          
          if (nota >= 5) {
              cont1++;
          } else if (nota >= 4 && nota < 5) {
              cont2++;
          } else {
              cont3++;
          }
      }
      
      System.out.println("Hay " + cont1 + " aprobados");
      System.out.println("Hay " + cont2 + " casi aprobados");
      System.out.println("Hay " + cont3 + " bien suspendidos");
  }
}
