package updateSolEda;

 

import librerias.estructurasDeDatos.modelos.Map;
import librerias.estructurasDeDatos.deDispersion.TablaHash;
import librerias.estructurasDeDatos.modelos.ListaConPI;

/**
 * Ejercicio 20, Tema 3-S4: escribe un metodo estatico que,
 * dados dos Map<Clave, Valor> m1 y m2 implementados con  
 * sendas Tablas Hash, devuelva el Map diferencia de m1 y m2, 
 * es decir un Map que contenga solo aquellas Entradas de m1 
 * que no esten tambien en m2
 * 
 * @author (EDA) 
 * @version (2018)
 */

public class MapDiferencia {

    public static void main(String[] args) {
        Map<String, Integer> m1 = new TablaHash<String, Integer>(10);
        Map<String, Integer> m2 = new TablaHash<String, Integer>(10);
        m1.insertar("uno", 1); 
        m1.insertar("dos", 2); 
        m1.insertar("tres", 3);
        m1.insertar("cuatro", 4); 
        m1.insertar("seis", 6);
        m2.insertar("tres", 3); 
        m2.insertar("cuatro", 4);
        m2.insertar("siete", 7); m2.insertar("ocho", 8);
        System.out.println("Map diferencia:\n" + diferencia(m1, m2));
    }
    
    private static <C, V> Map<C, V> diferencia(Map<C, V> m1, Map<C, V> m2) {
        Map<C, V> res = new TablaHash<C, V>(m1.talla());
        ListaConPI<C> lpi = m1.claves();
        for (lpi.inicio(); !lpi.esFin(); lpi.siguiente()) {
            C clave = lpi.recuperar();
            if (m2.recuperar(clave) == null) {
                res.insertar(clave, m1.recuperar(clave));
            }
        }
        return res;
    }
}
