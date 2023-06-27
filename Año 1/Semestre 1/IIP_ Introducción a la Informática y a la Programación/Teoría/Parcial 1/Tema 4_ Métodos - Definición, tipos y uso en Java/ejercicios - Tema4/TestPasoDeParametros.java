/**
 * TestPasoDeParametros: Programa-Test del paso 
 * de parametros en Java, basado en una pregunta  
 * del Primer Parcial del curso 2014-2015.
 *
 * @author IIP
 * @version Curso 2016-2017
 */

public class TestPasoDeParametros {
    
    public static void main(String[] args) {
        PuntoR p = new PuntoR(1.0, -1.0);
        metodo1(33, p);
    }
    
    public static void metodo1(double d, PuntoR p) {
        System.out.println("d vale " + d);
        System.out.println("El punto p es " + p.toString());

        metodo2(d, p);

        System.out.println("d vale " + d);
        System.out.println("El punto p es " + p.toString());
    }

    public static void metodo2(double x, PuntoR p) {
        x = x + 2;
        p.mover(x, x + 2);
    }
}
