/**
 * Clase Ejercicio4C3: Programa con el codigo asociado al ejercicio 4
 * del Capitulo 3 del libro de la asignatura
 * 
 * @author Libro IIP-PRG
 * @version 2015-2016
 */

public class Ejercicio4C3 {
    
    public static void main(String[] args) {
        
        int a = 5, b = 3;
        System.out.println("3 / 4 * (a * a - b) se evalua a " 
                           + 3 / 4 * (a * a - b) 
                           + ", cuando el resultado que se quiere es 16.5");
        System.out.println("Como modificar la expresion para obtenerlo?");
        System.out.println();
        //Solucion: poner 4.0 en lugar de 4 para que la division NO sea entera!!
        System.out.println("3 / 4.0 * (a * a - b) se evalúa a " 
                       + 3 / 4.0 * (a * a - b) + ", el resultado deseado");
        System.out.println();
        System.out.println("Tambien: 3 / (double) 4 * (a * a - b) se evalua a " 
                           + 3 / (double) 4 * (a * a - b));
        System.out.println("Importante: a y b mantienen valor y tipo: a = " 
                           + a + " y b = " + b); 
        System.out.println("Importante tambien: con casting a double " 
                           + "NO se modifica el literal 4, de tipo int; " 
                           + "sin el, SI (4 int pasa a 4.0 double");
        System.out.println();
        
        //Nueva cuestion: 
        System.out.println("Por que (3 / 4) * ((double) (a * a - b)) vale 0?");
        System.out.println();
        System.out.println();
        
        int expresion = a / b * 1000 + 304;
        System.out.println("a / b * 1000 + 304 se evalua a " + expresion 
               + ", cuando el resultado que se quiere es 1970.6666666666667");
        //OJO: nota que segun escribas dentro del System.out.println 
        //expresion o a / b * 1000 + 304 el resultado que se muestra 
        //por pantalla es uno u otro: si escribes expresion se muestra 
        //"... se evalua a 1304 ...", pero si escribes a / b * 1000 + 304 
        //se muestra "... se evalua a 1000304 ..."  Por que?
        System.out.println("Como modificar la expresion para obtenerlo?");
        System.out.println();
        //Solucion: hacer (double) b para que la division NO sea entera!! 
        //No se requieren parentesis por la precedencia del casting
        double expresionMod = a / (double) b * 1000 + 304;
        System.out.println("a / (double) b * 1000 + 304 se evalua a " 
                           + expresionMod + ", el resultado que se quiere");
        //OJO: de nuevo, segun escribas dentro del System.out.println 
        //expresionMod o a / (double) b * 1000 + 304 el resultado que 
        //se muestra por pantalla es uno u otro: si escribes expresionMod 
        //se muestra "... se evalua a 1970.6666666666667 ...", 
        //pero si escribes a / (double) b * 1000 + 304 se muestra 
        //"... se evalua a 1666.6666666666667304 (...)" Por que?
        System.out.println();
        
        //Nueva cuestion:
        System.out.println("En lugar de (double) b, puedes escribir b.0 "
                         + "como has hecho con el literal 4? Por que?");
        System.out.println();
        System.out.println();
        
        System.out.println("(100 / a + b / 2) * 5 se evalua a " 
                           + (100 / a + b / 2) * 5 
                           + ", cuando el resultado que se quiere es 107.5");
        System.out.println("Como modificar la expresion para obtenerlo?");
        System.out.println();
        //Solucion: poner 2.0 en lugar de 2 para que la division NO sea entera!!
        System.out.println("(100 / a + b / 2.0) * 5 se evalua a " 
                         + (100 / a + b / 2.0) * 5  + ", el resultado deseado");
        //Nueva cuestion. De nuevo, NO sirve hacer solo (double) a. Por que?
    }
}