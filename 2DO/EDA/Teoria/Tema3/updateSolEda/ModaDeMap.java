package updateSolEda;

 
import librerias.estructurasDeDatos.modelos.ListaConPI;
import librerias.estructurasDeDatos.modelos.Map;
import librerias.estructurasDeDatos.deDispersion.TablaHash;
/**
 * Ejercicio 11, Tema 3-S4: usando un Map, diseña un método (estático)  
 * modaDe que obtenga la moda de un array genérico v,  i.e. que devuelva  
 * el primer elemento de un array v que se repite más veces
 * 
 * @author (EDA) 
 * @version (2018)
 */
public class ModaDeMap {

    public static void main(String[] args) {
        Integer[] aI = crearArray();
        System.out.println("El array creado es: " + mostrarArray(aI));
        Integer moda = modaDe(aI);
        System.out.println("La moda es: " + moda);
    }
    
    private static Integer[] crearArray() {
        int talla = (int) (Math.random() * 20);
        Integer[] res = new Integer[talla];
        for (int i = 0; i < talla; i++) {
            res[i] = new Integer((int) (Math.random() * 10));
        }
        return res;
    }
    private static String mostrarArray(Integer[] a) {
        String res = "";
        for (int i = 0; i < a.length; i++) {
            res += "  " + a[i];
        }
        return res;
    }
    private static <T> T modaDe(T[] a) {
        Map<T, Integer> m = new TablaHash<T, Integer>(a.length);
        for (int i = 0; i < a.length; i++) {
            Integer frec = m.recuperar(a[i]);
            if (frec == null) { m.insertar(a[i], 1); }
            else { m.insertar(a[i], ++frec); }
        }
        ListaConPI<T> lpi = m.claves();
        T claveMax = null;
        Integer frecMax = 0;
        for (lpi.inicio(); !lpi.esFin(); lpi.siguiente()) {
            T clave = lpi.recuperar();
            Integer frec = m.recuperar(lpi.recuperar());
            if (frec > frecMax) {
                claveMax = clave;
                frecMax = frec;
            }
        }
        return claveMax;
        // Solucion alternativa: usar un solo bucle
        /*Map<T, Integer> m = new TablaHash<T, Integer>(a.length);
        T moda = null;
        int frecModa = 0;
        for (int i = 0; i < a.length; i++) {
            Integer frec = m.recuperar(a[i]);
            if (frec == null) { frec = 1; }
            else { frec++; } 
            m.insertar(a[i], frec); 
            if (frec > frecModa) {
                frecModa = frec;
                moda = a[i]; 
            }
        }
        return moda;*/
    }
}
