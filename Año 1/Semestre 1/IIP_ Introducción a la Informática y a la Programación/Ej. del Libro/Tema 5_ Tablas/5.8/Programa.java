
/**
 * Write a description of class Programa2 here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
import java.util.Arrays;

public class Programa {
    public static void main(String[] args) {
        int sin[], con[] = {1, 2, 3, 2, 1, 3, 4, 2, 3, 5};
        
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
