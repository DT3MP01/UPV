/**
 * Clase TestPilaRAObjetos: Programa equivalente a TestPilaRA 
 * PERO que intercambia los objetos referenciados por las variables a y b.
 * 
 * @author Mabel
 * @version 2017-2018
 */

public class TestPilaRAObjetos {
    public static void main(String[] args) {
        System.out.println("--------------Metodo activo: main-------------");
        PuntoR a = new PuntoR(1.5, 1.5);
        PuntoR b = new PuntoR();
        // Mira los valores actuales de (los OBJETOS) a y b en el RA del metodo activo
        System.out.println("-->ANTES DE ejecutar intercambiar, a = " + a  
                           + " y b = " + b);
        
        intercambiar(a, b);
        
        // Mira los valores actuales de (los OBJETOS) a y b en el RA del metodo activo
        // ¿Han cambiado al ejecutar intercambiar(a, b)? ¿Por que?
        System.out.println("\n-->TRAS ejecutar intercambiar, a = " + a  
                           + " y b = " + b);
    }
    
    // Encapsula el codigo de intercambio de (los OBJETOS) a y b
    private static void intercambiar(PuntoR a, PuntoR b) {
        System.out.println("\n\t----Metodo activo: intercambiar----");
        PuntoR copiaDeA = new PuntoR(a.getX(), a.getY());
        // Mira los valores actuales de (los OBJETOS) a, b y copiaDeA en el RA del metodo activo
        System.out.println("\n\t-->INICIALMENTE, a = " + a  + ", b = " + b 
                           + " y copiaDeA = " + copiaDeA);
        
        a.setX(b.getX()); a.setY(b.getY());
        b.setX(copiaDeA.getX()); b.setY(copiaDeA.getY());
        
        // Mira los valores actuales de (los OBJETOS) a, b y copiaDeA en el RA del metodo activo
        // ¿Han cambiado? ¿Por que?
        System.out.println("\n\t-->FINALMENTE, a = " + a  + ", b = " + b 
                           + " y copiaDeA = " + copiaDeA);
    }
}