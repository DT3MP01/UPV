/**
 * Clase PruebaPuntoR: Programa de prueba de la clase PuntoR 
 * @author IIP
 * @version 2015-2016
 */

public class PruebaPuntoR {
    
    public static void main(String[] args) {
        PuntoR a = new PuntoR(1.5, 1.5);
        PuntoR b = new PuntoR();
        double dB = b.distOrigen();
        double dA = a.distOrigen();
    }
}

