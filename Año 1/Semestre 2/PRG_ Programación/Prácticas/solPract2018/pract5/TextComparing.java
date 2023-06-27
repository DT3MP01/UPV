package pract5;

import java.io.File;
import java.util.Scanner;
import java.io.FileNotFoundException;

/**
 * TextComparing 
 * Clase - comando de sistema, que devuelve la union o interseccion
 * de las palabras de ciertos textos.
 *
 * @author (PRG. ETSINF. UPV)
 * @version (Curso 2017/18)
 */
public class TextComparing {
    
    private final static String USAGE = 
        "Uso: TextComparing [-i|-u] nomFich1 nomFich2"; 
    private final static String ERR1 = "Mal acceso al fichero: ";
    private final static String DELIMITERS = 
                      "[\\p{Space}\\p{Punct}\\p{Digit}¡¿]+";
        
    /**
     * Argumentos:
     * 1) "-u" o "-i" para union o interseccion respectivamente.
     * 2) Fichero de texto 1 de entrada.
     * 3) Fichero de texto 2 de entrada.
     * 
     * Resultado en la salida estandar.
     */
    public static void main(String[] args) {        
        boolean err = args.length != 3 
            || !(args[0].equals("-u") || args[0].equals("-i"));
        
        if (err) { System.out.println(USAGE); } 
        else { compare(args[1], args[2], args[0]); }
    }
    
    /**
     * Escribe en la salida estandar el resultado de comparar
     * los conjuntos de palabras de los ficheros de texto cuyos
     * nombres estan en nF1 y nF2. Si la opcion es "-i", escribe 
     * la interseccion de ambos conjuntos, si es "-u" escribe la union.
     * @param nF1 String, nombre del primer fichero.
     * @param nF2 String, nombre del segundo fichero.
     * @param option String
     */
    public static void compare(String nF1, String nF2, String option) {
         // Apertura previa:
        Scanner s1 = null; Scanner s2 = null;             
        try {
            s1 = new Scanner(new File(nF1));
            s2 = new Scanner(new File(nF2));
            
            // procesamiento:
            SetString cS1 = setReading(s1);            
            SetString cS2 = setReading(s2);
                        
            if (option.equals("-i")) {
                System.out.println(cS1.intersection(cS2));
            } else { 
                System.out.println(cS1.union(cS2));
            }                
        } catch (FileNotFoundException e) {
            System.out.print(ERR1 + e.getMessage());
        } finally {
            if (s1 != null) { s1.close(); }
            if (s2 != null) { s2.close(); }        
        }    
    }
   
    /**
     * Devuelve el SetString de las palabras leidas de s 
     * segun los separadores dados, por defecto, en DELIMITERS.
     * @param s Scanner.
     * @return el conjunto de palabras leidas de s.
     */
    private static SetString setReading(Scanner s) {            
        s.useDelimiter(DELIMITERS);
        SetString setS = new SetString();
        while (s.hasNext()) {
            String word = s.next();
            setS.add(word);    
        }
        return setS;
    }
    
}
