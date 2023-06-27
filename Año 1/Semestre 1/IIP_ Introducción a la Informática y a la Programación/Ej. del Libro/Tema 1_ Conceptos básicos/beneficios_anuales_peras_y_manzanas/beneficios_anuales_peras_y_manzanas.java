
/**
 * Write a description of class beneficios_anuales_peras_y_manzanas here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */

import java.util.Scanner;
import java.util.Locale;

public class beneficios_anuales_peras_y_manzanas
{
   public static void main(String[] args) {
       final double precio_manzanas;
       precio_manzanas = 2.35;
       final double precio_peras;
       precio_peras = 1.95;
       
       int vManza1t, vManza2t, vManza3t, vManza4t; //ventas (en kilos) por trimestre
       int vPeras1t, vPeras2t, vPeras3t, vPeras4t;
       
       double impTotal;
       Scanner sc = new Scanner(System.in);
       sc.useLocale(Locale.US);
       
       //pedimos los datos
       System.out.println("Para las manzanas: ");
       System.out.print("Ventas (en kilos) del primer trimestre: ");
       vManza1t = sc.nextInt();
       System.out.print("Ventas (en kilos) del segundo trimestre: ");
       vManza2t = sc.nextInt();
       System.out.print("Ventas (en kilos) del tercer trimestre: ");
       vManza3t = sc.nextInt();
       System.out.print("Ventas (en kilos) del cuarto trimestre: ");
       vManza4t = sc.nextInt();
       
       System.out.println("Para las peras: ");
       System.out.print("Ventas (en kilos) del primer trimestre: ");
       vPeras1t = sc.nextInt();
       System.out.print("Ventas (en kilos) del segundo trimestre: ");
       vPeras2t = sc.nextInt();
       System.out.print("Ventas (en kilos) del tercer trimestre: ");
       vPeras3t = sc.nextInt();
       System.out.print("Ventas (en kilos) del cuarto trimestre: ");
       vPeras4t = sc.nextInt();
       
       //calculamos el importe
       
       impTotal = (vManza1t + vManza2t + vManza3t + vManza4t) * precio_manzanas;
       impTotal += (vPeras1t + vPeras2t + vPeras3t + vPeras4t) * precio_peras;
       
       System.out.println("El importe total es de: " + impTotal + " euros");
    }
}
