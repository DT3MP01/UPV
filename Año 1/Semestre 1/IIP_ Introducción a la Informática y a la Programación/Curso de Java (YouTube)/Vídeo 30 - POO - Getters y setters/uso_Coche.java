
public class uso_Coche {
    
    public static void main (String []args) { 
        /**
         * En un programa con varias clases, solo va a haber UNA
         * CLASE con un programa main (lo que convertirá 
         * a la clase en principal), y en este caso, sería uso_Coche.
         * 
         * La ejecución siempre comieza en el método main y va de arriba
         * a abajo.
         */
        
        Coche Renault = new Coche(); /**INSTANCIAR UNA CLASE
        o EJEMPLARIZAR UNA CLASE --> Renault es un ejemplo de la clase Coche.
        
        New coche lo que hace es desplazar el flujo del programa hasta
        el método constructor "public Coche();" y recopila sus características.
        Una vez llegado al corchete, el flujo vuelve a comenzar en la
        siguiente línea, después de "new Coche();"
        */
       
       /**
        Invocar a un método:
        nombre_objeto.método();
        */
       Renault.establece_color();
       
       System.out.println(Renault.dime_color());
        
       /**
        * Renault.largo=3000; 
        * Esta instrucción imprimiría un error en pantalla ya que
        el atributo largo es privado.
        */
        //Renault.ruedas = 3;
        //System.out.println("Este coche tiene " + Renault.ruedas + " ruedas.");
        /** 
        Esto es posible si no se encapsulan los atributos de la
        clase "public class Coche" como private, protected, etc.
        */
       
       System.out.println(Renault.dime_largo());
       /**
        El sistema imprimirá en pantalla el método getter "dime_largo"
        */
    }
}