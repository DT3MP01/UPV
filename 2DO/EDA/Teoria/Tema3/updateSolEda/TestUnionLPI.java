package updateSolEda;

 
import librerias.estructurasDeDatos.modelos.ListaConPI;
import librerias.estructurasDeDatos.lineales.LEGListaConPI;

/**
 * Programa  para probar el codigo de la clase UnionLPI
 * 
 * @author (EDA) 
 * @version (Marzo 2016)
 */

public class TestUnionLPI {

    public static void main(String[] args) {
        ListaConPI<Integer> lpi1 = crearLPI();
        ListaConPI<Integer> lpi2 = crearLPI();
        System.out.println("LPI 1: " + lpi1.toString());
        System.out.println("LPI 2: " + lpi2.toString());
        System.out.println("Union lenta: " + UnionLPI.unionLenta(lpi1, lpi2));
        System.out.println("Union: " + UnionLPI.union(lpi1, lpi2));
    }
    
    private static ListaConPI<Integer> crearLPI() {
        int talla = (int) (Math.random() * 20);
        ListaConPI<Integer> res = new LEGListaConPI<Integer>();
        for (int i = 0; i < talla; i++) {
            res.insertar((int) (Math.random() * 10));
        }
        return res;
    }
}
