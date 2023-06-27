
/**
 Modularización: Dividir el fichero en clases, como por ejemplo en Coche.java y
 en uso_Coche.java.
 
 Encapsulación: 
 */

    public class Coche {
        /**
    Solo debe haber UNA ÚNICA CLASE PÚBLICA en un mismo fichero y el nombre
    de ella, deberá ser el mismo que el del fichero. En este caso, por tanto,
    el nombre del fichero debería llamarse y se llama "Coche.java". El método
    main, además, debe estar en la clase principal.
    
    EL RESTO DE LAS CLASES NO deben ser PÚBLICAS.
    
    Para ENCAPSULAR las propiedades, se puede añadir un MODIFICADOR DE ACCESO
    (private). De esta manera, se puede acceder a la propiedad desde la
    propia clase, pero no desde otras.
         */
        
        private int ruedas;
        private int largo;
        private int ancho;
        private int motor;
        private int peso;
        
    public Coche() { /**método constructor - establece el estado inicial del
        coche.
        Sintaxis método constructor: public nombre_clase(){}
        */
        
        ruedas = 4;
        largo = 2000;
        ancho = 300;
        motor = 1600;
        peso = 500;
    }
    
    /**
     Se podría poner a continuación de "public Coche" el método main para no
     utilizar la clase "uso_Coche".
     
   public static void main (String []args) {
       Coche Renault = new Coche();
       System.out.println("Este coche tiene " + Renault.largo + " ruedas.");
       */
    }
