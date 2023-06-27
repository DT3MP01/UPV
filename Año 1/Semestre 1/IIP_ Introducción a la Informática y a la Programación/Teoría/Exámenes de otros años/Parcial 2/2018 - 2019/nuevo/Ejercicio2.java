public class Ejercicio2 {

    /** PRECONDICIÓN: k > 0 AND l > 2 */
    
    public static boolean ejercicio2(int k, int l) {
        double d;
        
        boolean valor = false;
        
        for (int i = 1; i < k; i++) {
            d = (i * ((l - 2) * i - (l - 4))) / 2;
            if (d == k) {
                valor = true;
            }
        }
        
        return valor;
    }
}