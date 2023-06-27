import java.util.Scanner; 

/** Ejemplos de uso de switch: ejercicios 7 y 8
 *  del libro de la asignatura */
 
public class TestSwitch {

    public static void main(String[] args) {
        ejercicio7();
        ejercicio8();
    }
    
    public static void ejercicio7() {
        // Indica que se muestra por pantalla tras
        // ejecutar el siguiente codigo y por que
        switch (2) {
            case 1: 
                System.out.println(1); break;
            case 2: 
                System.out.println(2);
            case 3:  
                System.out.println(3); break;
            default: 
                System.out.println(4);
        }
    }
    public static void ejercicio8() {
        // Indica que se muestra por pantalla tras
        // ejecutar el siguiente codigo y por que
        int primOpcion = 2; // Y si primOpcion = 2?
        switch (primOpcion + 1) {
            case 1:  
                System.out.print("Ensalada ");  break;
            case 2:  
                System.out.print("Paella ");    break;
            case 3:  
                System.out.print("Emperador ");
            case 4:  
                System.out.print("Helado ");    break;
            default: 
                System.out.print("Buen provecho");
        }
    }
}

