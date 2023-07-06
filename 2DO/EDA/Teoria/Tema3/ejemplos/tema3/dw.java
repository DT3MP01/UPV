package ejemplos.tema3;


/**
 * Write a description of class dw here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class dw {
           public static String barajar(Integer[] v) {
        Map<Integer,Integer> map= new TablaHash<String, String>(v.length);
        for(int i = 0; i < v.length; i++) {
        map.insertar(v[i],v[i]);
        }
        return m.claves.toString();  
    }
}
