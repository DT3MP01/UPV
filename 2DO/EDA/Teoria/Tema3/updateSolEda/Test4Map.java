package updateSolEda;

 

import librerias.estructurasDeDatos.modelos.Map;
import librerias.estructurasDeDatos.deDispersion.TablaHash;
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;

/**
 * Ejercicio 4, Tema 3-S1: Traduccion Bilingue, Palabra a Palabra, de un texto
 * Para ello, la clase proporciona dos metodos:
 *  1.- cargarDiccionario: crea y devuelve el Map que se usa en la traduccion, 
 *      leyendo sus Entradas del fichero diccioSpaEng.txt ubicado en eda
 *  2.- traducir: traduce la frase textoC palabra a palabra usando el Map m 
 *      Cuando m no contenga la traduccion para una palabra de textoC, el 
 *      String resultado de traducir debe contener el literal "<error>" en  
 *      lugar de su traduccion
 *      
 * @author (prof EDA) 
 * @version (Curso 2018-2019)
 */

public class Test4Map {
    
    public static Map<String, String> cargarDiccionario() {
        String nDic = "diccioSpaEng.txt";
        Map<String, String> m = new TablaHash<String, String>(100);
        try { 
            Scanner ft = new Scanner(new File(nDic), "ISO-8859-1");
            while (ft.hasNextLine()) {
                String linea = ft.nextLine();
                String[] a = linea.split("\t");
                m.insertar(a[0], a[1]);
            }
            ft.close();
            return m;
        } catch (FileNotFoundException e) {
            System.out.println("** Error: No se encuentra el fichero " + nDic);
            return null;
        }
    }
            
    public static String traducir(String textoC, Map<String, String> m) {
        String traduccion = "";
        String[] texto = textoC.split("[ .,;:() \t]");
        for (int i = 0; i < texto.length; i++) {
            String aux = m.recuperar(texto[i]);
            if (aux == null) { traduccion += " <error>"; }
            else             { traduccion += " " + aux; }
        }
        return traduccion;
    }
}
