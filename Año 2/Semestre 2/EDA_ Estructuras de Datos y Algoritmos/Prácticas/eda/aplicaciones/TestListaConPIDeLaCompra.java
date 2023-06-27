package aplicaciones;

import librerias.estructurasDeDatos.modelos.ListaConPI;
import librerias.estructurasDeDatos.lineales.LEGListaConPI;

/** Uso del modelo ListaConPI<E>: Lista de la compra
 *  @author EDA 
 *  @version 2018
 */

public class TestListaConPIDeLaCompra {
    public static void main(String[] args) {
        ListaConPI<String> l = new LEGListaConPI<String>();
        
        /*Opcional: l.inicio();*/

        l.insertar("patatas"/*, l.talla()*/);
        l.insertar("cerezas"/*, l.talla()*/);
        l.insertar("leche"/*, l.talla()*/);
        System.out.println("Mi lista de la compra es:\n" + l.toString() + "\n");
        
        System.out.println("¿He olvidado apuntar el perejil?");
        // Busqueda secuencial de "perejil" en la lista tal que 
        // si no esta se apunta al final de esta
        
        l.inicio();
        String e = "perejil";
        
        while (!l.esFin() && !l.recuperar().equals(e)) { 
            l.siguiente(); 
        }
        
        if (l.esFin()) {

            // MODIFICACION 1: apuntar "perejil" al principio de la lista, 
            // en lugar de al final:  
            l.inicio(); 

            l.insertar(e);
            System.out.println("Pues si. Lo apunto al principio y arreglado:\n"
                               + l.toString());
        } else { 
            System.out.println("Pues no. Ya esta en la lista!"); 
        }

        // MODIFICACION 2: agnadir "perejil" antes de "cerezas"
        // Paso 2.1: eliminarlo de la lista, de la que es el primero
        l.inicio(); 
        l.eliminar();
        System.out.println("Tacho perejil del principio:\n" + l.toString());
        
        // Paso 2.2: para apuntar "perejil" antes que "cerezas": 
        // desplazamos primero el PI de l hasta "cerezas" y, luego, 
        // insertamos "perejil"
        l.inicio(); 
        while (!l.esFin() && !l.recuperar().equals("cerezas")) { 
            l.siguiente(); 
        }
        // Resolucion de la busqueda CON GARANTIA DE EXITO: 
        l.insertar(e);
        System.out.println("Apunto el perejil antes que las cerezas:\n"
                           + l.toString());
    }
}