
/**
 * Clase de Utilidades
 * 
 * @version (Octubre 2018)
 */
public class MiUtil {

    /** devuelve el mayor de dos int x e y, o y si x es igual a y */
    public static int max(int x, int y) { 
        int max = y;
        if (x > max) { max = x; }
        return max; 
    }
    /** devuelve el mayor de dos double x e y, o y si x es igual a y */
    public static double max(double x, double y) { 
        if (x > y) { return x; }
        else { return y; } 
    }
    
    /** Dado un numero de mes devueve la estacion a la que pertenece */
    public static String estacion(int numMes) {
        String estacion = "";
        switch (numMes) {
            case  1: case  2: case 12: 
                estacion = "Invierno"; break;
            case  3: case  4: case  5: 
                estacion = "Primavera"; break;
            case  6: case  7: case  8: 
                estacion = "Verano"; break;
            case  9: case 10: case 11: 
                estacion = "Otoño"; break;
            default: 
                estacion = "Error"; break;
        }
        return estacion;
    }
} 

