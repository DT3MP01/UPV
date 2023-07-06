package updateSolEda;

 

import librerias.estructurasDeDatos.modelos.ListaConPI;
import librerias.estructurasDeDatos.lineales.LEGListaConPI;
import librerias.estructurasDeDatos.modelos.Map;
import librerias.estructurasDeDatos.deDispersion.TablaHash;

/**
 * Ejercicio 11, Tema 3-S4: dadas dos Listas Con Punto de interes l1 y l2, 
 * implementar un metodo eficiente que obtenga un String en el que aparecen 
 * cada uno de los elementos que conforman la union de l1 y l2 seguido del 
 * numero de veces que este aparece repetido en las listas
 * 
 * @author (EDA) 
 * @version (2018)
 */

public class UnionLPI {
    
    public static <E> String unionLenta(ListaConPI<E> l1, ListaConPI<E> l2) {
        
        ListaConPI<Par> aux = new LEGListaConPI<Par>();
        for (l1.inicio(); !l1.esFin(); l1.siguiente()) {
            E e = l1.recuperar(); aux.inicio();
            // Bucle de busqueda 1
            while (!aux.esFin() && !e.equals(aux.recuperar().dato)) {
                aux.siguiente();
            }
            if (aux.esFin()) {
                Par<E> p = new Par<E>(e, 1);
                aux.insertar(p); 
            } else { aux.recuperar().frec++; }
        }
        for (l2.inicio(); !l2.esFin(); l2.siguiente()) {
            E e = l2.recuperar(); aux.inicio();
            // Bucle de busqueda 2
            while (!aux.esFin() && !e.equals(aux.recuperar().dato)) {
                aux.siguiente();
            }
            if (aux.esFin()) {
                aux.insertar(new Par<E>(e, 1)); 
            } else { aux.recuperar().frec++; }
        }
        return aux.toString();
    }
    
    // Claves para resolver el ejercicio:
    //
    // Cuestion (1) Coste de unionLenta
    // Talla del problema x = (l1.talla(), l2.talla()) o 
    //                    x = max(l1.talla(), l2.talla()) 
    // Caso Mejor: todos los elementos de l1 y l2 son iguales
	//             Tm(x) in Theta(max(l1.talla(), l2.talla())
	//             Tm(x) in Theta(x)
	// Caso Peor: todos los elementos de l1 y l2 son diferentes
	//             Tp(x) = k1*l1.talla()^2 + k2*l2.talla()^2 + ...
	//             Tp(x) in Theta(x^2)
	// Cotas de coste: T(x) in Omega(x) y T(x) in O(x^2)
	//
    // Cuestion (2): ?Cuales son las "zonas" del codigo que
    // provocan el coste cuadratico en promedio y peor de los casos?
    // Los bucles de busqueda 1 y 2, que tienen que ser substituidos por
    // busquedas mas eficientes para poder mejorar la eficiencia -->
    // Usando un Map implementado con una Tabla Hash<E, Integer> de 
    // talla maxima estimada l1.talla()+ l2.talla(), en lugar de una 
    // ListaConPI<Par> es posible rebajar el coste de estos bucles de 
    // lineal a constante y, por tanto, rebajar el coste del metodo de 
    // cuadratico a lineal en promedio y peor de los casos 
    // El metodo resultante es:
    public static <E> String union(ListaConPI<E> l1, ListaConPI<E> l2) {
        int talla = l1.talla() + l2.talla();
        Map<E, Integer> d = new TablaHash<E, Integer>(talla);
        String res = "";
        for (l1.inicio(); !l1.esFin(); l1.siguiente()) {
            E e = l1.recuperar();
            Integer frec = d.recuperar(e);
            if (frec != null) { d.insertar(e, ++frec); }
            else              { d.insertar(e, 1); }
        }
        for (l2.inicio(); !l2.esFin(); l2.siguiente()) {
            E e = l2.recuperar();
            Integer frec = d.recuperar(e);
            if (frec != null) { d.insertar(e, ++frec); }
            else              { d.insertar(e, 1); }
        }
        return d.toString();     
    }
    // Coste lineal con la suma de las tallas de las listas
    
}

/** Clase envolvente para representa un dato y su frecuencia de aparicion
 *  @param <E> el tipo de los datos
 */
class Par<E> {
    
    protected E dato; 
    protected int frec;
    Par(E d, int f) { dato = d; frec = f; }
    public String toString() { 
        return "(" + dato.toString() + ", " + frec + ")"; 
    }
}
