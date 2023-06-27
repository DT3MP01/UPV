

import java.util.Scanner;
import java.util.Arrays;
import java.util.Locale;

public class Ejercicio3 {
  public static void main(String[] args) {
     Scanner sc = new Scanner(System.in);
     sc.useLocale(Locale.US);
     
     int limites[] = {15, 35, 50, 37, 25, 70};
     
     double valores[] = {10, 20, 50, 40, 30, 80};
     
     System.out.println(Arrays.toString(ejercicio3(limites, valores)));
  }
  public static int[] ejercicio3(int[] limites, double[] valores) {
        int tamLimites = limites.length;
        
        int tamValores = valores.length;
        
        int contValores;
        contValores = 0;
        
        int nuevo[] = new int[tamLimites];
        
        for (int i = 0; i < tamLimites; i++) {
            contValores = 0;
            for (int z = 0; z < tamValores; z++) {
                if (limites[i] > valores[z]) {
                    contValores++;
                }
                nuevo[i] = contValores;
            }
        }
        
        return nuevo;
    }
}