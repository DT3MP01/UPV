
/**
 * Write a description of class Programa here.
 *
 * @David
 * @version (a version number or a date)
 */
import java.util.Scanner;
import java.util.Arrays;
import java.util.Locale;

public class Programa {
  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    sc.useLocale(Locale.US);
    
    double t[] = new double[5];
    
    /* num1 = sc.nextDouble();
    num2 = sc.nextDouble();
    num3 = sc.nextDouble();
    num4 = sc.nextDouble();
    num5 = sc.nextDouble(); */
    
    for (int i = 0; i < t.length; i++) {
        System.out.println("Introduce un número");
        t[i] = sc.nextDouble();
    }
   
    //System.out.println(Arrays.toString(t));
    
    for (int i = 0; i < t.length; i++) {
        System.out.println(t[i]);
    }
  }
}
