
/**
 * Write a description of class Programa here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
import java.util.Scanner;
import java.util.Arrays;

public class Programa {
  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    
    System.out.println("Introduce seis números enteros");
    final int TAM = 6;
    int t[] = new int[TAM];
    
    for (int i = 0; i < TAM; i++) {
        t[i] = sc.nextInt();
    }
    
    System.out.println("La tabla en formato ordenado sería: ");
    
    Arrays.sort(t);
    
    for (int i = 0; i < TAM; i++) {
        System.out.println(t[i]);
    }
    
    System.out.println("Introduce otros seis números enteros");
    int t1[] = new int[TAM];
    
    for (int i = 0; i < TAM; i++) {
        t1[i] = sc.nextInt();
    }
    
    System.out.println("La segunda tabla en formato ordenado sería: ");
    
    Arrays.sort(t1);
    
    for (int i = 0; i < TAM; i++) {
        System.out.println(t1[i]);
    }
    
    System.out.println("Si juntamos los dos 12 números, quedaría: ");
    
    int destino[] = new int[2 * TAM];
    
    int indiceT, indiceT1, indiceDestino;
    
    indiceT = 0;
    indiceT1 = 0;
    indiceDestino = 0;
    
    while (indiceT < TAM && indiceT1 < TAM) {
        if (t[indiceT] < t1[indiceT1]) {
            destino[indiceDestino] = t[indiceT];
            indiceT++;
        } else {
            destino[indiceDestino] = t1[indiceT1];
            indiceT1++;
        }
        indiceDestino++;
    }
    
    if (indiceT == TAM) {
        while (indiceT1 < TAM) {
            destino[indiceDestino] = t1[indiceT1];
            indiceT1++;
            indiceDestino++;
        }
    } else {
        while (indiceT < TAM) {
            destino[indiceDestino] = t[indiceT];
            indiceT++;
            indiceDestino++;
        }  
    }
    
    for (int i = 0; i < destino.length; i++) {
        System.out.println(destino[i]);
    }
  }
}
