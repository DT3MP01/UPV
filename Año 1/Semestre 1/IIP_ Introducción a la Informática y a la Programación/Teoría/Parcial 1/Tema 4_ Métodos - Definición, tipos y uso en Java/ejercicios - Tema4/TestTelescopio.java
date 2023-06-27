import java.util.Scanner; // para poder leer de teclado con un Scanner 
import java.util.Locale;  // para poder leer de teclado usando el punto
                          // como separador de decimales 

/**
 * Clase TestTelescopio: Programa que usa la clase Telescopio, 
 * en base a su Especificacion (o Documentacion)
 * 
 * @author Mabel
 * @version 2016-17
 */

public class TestTelescopio {  
    
    public static void main(String[] args) {
        
        // Como en la clase Telescopio NO se ha definido mas que un 
        // constructor por defecto, para crear un telescopio t con 
        // una lente principal de 76.2 mm de diametro,   
        // una distancia focal de 165.1 mm y 
        // una distancia focal ocular de 20.32 mm 
        // NO SE PUEDE HACER MAS QUE EN DOS PASOS
       
        // PASO 1: crear un telescopio t ESTANDAR
        Telescopio t = new Telescopio(); 
       
        // PASO 2: usar los metodos modificadores (set) apropiados...
        // (a) actualizar el diametro de la lente principal de t a 76.2 mm
        t.setDiametro(76.2);
        // (b) actualizar la distancia focal de t a 165.1 mm
        t.setDFL(165.1);
        // (c) actualizar la distancia focal del ocular de t a 20.32 mm 
        t.setDFO(20.32);
       
        // Mostar por pantalla los aumentos de t redondeados a 2 decimales
        double aumentos = t.aumentos();
        double aumentosRound2 = Math.round(aumentos * 100) / 100.0;
        System.out.println("Aumentos de t: " + aumentosRound2);
        
        // Mostar por pantalla la relacion focal de t
        System.out.println("Relacion focal de t: " 
                           + (Math.round(t.relacionFocal() * 100) / 100.0));
       
        /*HASTA AQUI PODEIS COMPROBAR TODAS LAS INSTRUCCIONES EN EL CODE PAD*/
        
        // Crear un Scanner teclado con el que leer valores reales (double)
        // con separador . (formato americano)
        Scanner teclado = new Scanner(System.in).useLocale(Locale.US);
        // Actualizar al valor leido de teclado el diametro actual de t 
        t.setDiametro(teclado);
        // Mostrar por pantalla la relacion focal actual de t
        System.out.println("Nueva relacion focal de t: " 
                           + (Math.round(t.relacionFocal() * 100) / 100.0));
    }
}
