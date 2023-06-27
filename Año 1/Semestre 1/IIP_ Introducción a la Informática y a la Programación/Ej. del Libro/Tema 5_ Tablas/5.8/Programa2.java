
/**
 * Write a description of class Programa3 here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
import java.util.Arrays;
import java.util.Scanner;

public class Programa2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        System.out.println("Introduce de cuántos números quieres que sea la tabla");
        
        int num;
        num = sc.nextInt();
        
        int sin[], con[] = new int[num];
        
        System.out.println("Introduce los números de la tabla");
        
        for (int i = 0; i < con.length; i++) {
            con[i] = sc.nextInt();
        }
        
        sin = sinRepetidos(con);
        System.out.println(Arrays.toString(sin));
    }
    static int[] sinRepetidos(int t[]) {
        int copia[] = Arrays.copyOf(t, t.length);
        
        int numElem;
        numElem = copia.length;
        
        int i = 0; //índice del elemento a comprobar
        
        while (i < numElem) {
            int aBuscar = copia[i];
            int j = 0;//índice para el segundo recorrido: para buscar aBuscar
            
            while (j < i && copia[j] != aBuscar) {
                j++;
            }
            
            if (j < i) {
                copia[i] = copia[numElem - 1];
                numElem--;
            } else {
                i++;
            }
        }
        
        return Arrays.copyOf(copia, numElem);
    }
}
