package prueba1;
/**
 * Clase ExamenT3: Turno 3 - Ejercicio 1 - Parcial 1 Lab.
 * 
 * @author PRG 
 * @version Curso 2017-18
 */
public class ExamenT3 {    
    /**
     * Devuelve el String que resulta de eliminar todas 
     * las apariciones del char c en el String s.
     */
    public static String removeChar(String s, char c) {
        int h = s.length();
        if (h == 0) { return s; }
        else if (s.charAt(h) == c) {
            h--;
            return removeChar(s.substring(h-1),c);
        } 
        else { 
            h--;
            return removeChar(s.substring(h),c);
        }
    }
}