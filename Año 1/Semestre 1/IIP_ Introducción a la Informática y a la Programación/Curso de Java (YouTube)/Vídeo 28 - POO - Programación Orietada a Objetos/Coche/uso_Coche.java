
public class uso_Coche {
    
    public static void main (String []args) {
        
        /**
         * Sintaxis creación objetos:
         * nombre_clase nombre_del_objeto = new nombre_constructor();
         */
        Coche Renault = new Coche(); //INSTANCIAR UNA CLASE o EJEMPLARIZAR UNA CLASE --> Renault es un ejemplo de la clase Coche.
        
        System.out.println("Este coche tiene " + Renault.ruedas + " ruedas.");
        /** 
        Esta instrucción lo que hace es imprimir en pantalla el valor ruedas.
         */
    }
}