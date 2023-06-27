/**
 * Clase TestPilaRA: Programa que visualiza el funcionamiento de la  
 * PILA de llamadas. Para ello:
 ** Implementa el intercambio de dos variables de tipo double usando
 ** dos metodos (estaticos): main e intercambiar. 
 ** Desde el metodo main se invoca la ejecucion del metodo intercambiar.
 ***No existe objeto en curso y dos son los RA que coexisten en memoria
 * 
 * @author Mabel
 * @version 2017-2018
 */

public class TestPilaRA {
    public static void main(String[] args) {
        System.out.println("--------------Metodo activo: main-------------");
        PuntoR a = new PuntoR(1.5, 1.5); // double a = 5.65;
        PuntoR b = new PuntoR(); // double b = 6.87;
        // Mira los valores actuales de a y b en el RA del metodo activo
        System.out.println("-->ANTES DE ejecutar intercambiar, a = " + a  
                           + " y b = " + b);
        
        intercambiar(a, b);
        
        // Mira los valores actuales de a y b en el RA del metodo activo:
        // ¿Han cambiado al ejecutar intercambiar(a, b)? ¿Por que?
        System.out.println("\n-->TRAS ejecutar intercambiar, a = " + a  
                           + " y b = " + b);
    }
    
    // Encapsula el codigo de intercambio de (los valores) de a y b
    private static void intercambiar(/*double*/ PuntoR a, /*double*/ PuntoR b) {
        System.out.println("\n\t----Metodo activo: intercambiar----");
        /*double*/ PuntoR copiaDeA = a;
        // Mira los valores actuales de a, b y copiaDeA en el RA del metodo activo
        System.out.println("\n\t-->INICIALMENTE, a = " + a  + ", b = " + b 
                           + " y copiaDeA = " + copiaDeA);
        a = b;
        b = copiaDeA;
        
        // Mira los valores actuales de a y b en el RA del metodo activo
        // ¿Han cambiado? ¿Por que?
        System.out.println("\n\t-->FINALMENTE, a = " + a  + ", b = " + b 
                           + " y copiaDeA = " + copiaDeA);
    }
}