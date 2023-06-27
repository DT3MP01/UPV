package aplicaciones.primitiva;

import librerias.estructurasDeDatos.modelos.ListaConPI;
import librerias.estructurasDeDatos.lineales.LEGListaConPI;
import librerias.estructurasDeDatos.lineales.LEGListaConPIOrdenada;

/** 
 * ApuestaPrimitiva: representa una apuesta aleatoria de La Primitiva, 
 * o combinacion de 6 numeros distintos entre el 1 y el 49 elegidos  
 * de forma aleatoria.
 * 
 * @version Febrero 2019
 */

public class ApuestaPrimitiva {
    
    // Una Primitiva TIENE UNA Lista con PI que almacena
    // una combinación de 6 números de La Primitiva
    private ListaConPI<NumeroPrimitiva> combinacion;
    
    /**
     * Crea una ApuestaPrimitiva, o una combinación de  
     * seis numeros aleatorios con valores distintos y   
     * en el intervalo [1, 49].
     * 
     * @param ordenada Un boolean que indica si la combinación,  
     *                 sus 6 números, debe estar ordenada Asc.
     *                 (true) o no (false).           
     */
    public ApuestaPrimitiva(boolean ordenada) {
        if (ordenada) {
            combinacion = new LEGListaConPIOrdenada<>();
        } else {
            combinacion = new LEGListaConPI<>();
        }
        
        while (combinacion.talla() < 6) {
            NumeroPrimitiva n = new NumeroPrimitiva();
            if (posicionDe(n) == -1) {
                combinacion.insertar(n);
            }
        }
    }
    
    /**
     * Devuelve la posicion del numero n en una ApuestaPrimitiva, 
     * o -1 si n no forma parte de la combinacion. 
     * IMPORTANTE: se asume que el primer elemento de una combinacion 
     * está en su posición 0 y el último en la 5.
     * 
     * @param n un int
     * @return  la posición de n en una combinación, un valor int
     *          en el intervalo [0, 5] si n está en la combinación      
     *          o -1 en caso contrario
     */
    public final int posicionDe(NumeroPrimitiva n) {
        int indice = 0;
        combinacion.inicio();
        
        while (!combinacion.esFin()) {
            if (combinacion.recuperar().equals(n)) {
                return indice;
            } else {
                indice++;
                combinacion.siguiente();
            }
        }
        
        return -1;
    }
    
    /**
     * Devuelve el String que representa una ApuestaPrimitiva en el formato
     * texto que muestra el siguiente ejemplo: "16, 25, 28, 49, 9, 20"
     * 
     * @return el String con la ApuestaPrimitiva en el formato texto dado. 
     */
    public String toString() {
        combinacion.inicio();
        String s = "";
        
        for (int i = 0; i < combinacion.talla() - 1; i++) {
            s += combinacion.recuperar() + ", ";
            combinacion.siguiente();
        }
        s += combinacion.recuperar();
        
        return s;
    }
}
