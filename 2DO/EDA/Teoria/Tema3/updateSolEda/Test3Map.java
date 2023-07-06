package updateSolEda;

 
import librerias.estructurasDeDatos.modelos.Map; 
import librerias.estructurasDeDatos.modelos.ListaConPI;
import librerias.estructurasDeDatos.deDispersion.TablaHash; 
import java.util.Locale; 
import java.util.Scanner; 

/** Ejercicio 2, Tema 3-S1: Test3Map es un programa que lee un texto  
 *  de teclado y muestra por pantalla un listado en el que en cada 
 *  linea contiene una palabra repetida de dicho texto (que aparezca 
 *  mas de una vez) junto con su frecuencia de aparicion en el
 */

public class Test3Map {
    
    public static void main(String[] args) {
        Locale localEDA = new Locale("es", "US");
        Scanner teclado = new Scanner(System.in).useLocale(localEDA);
        System.out.println("Escribe texto (palabras separadas por blancos):");
        // Ej. 1- Frase sin palabras repetidas, o con frecuencia de aparicion 1:
        // "Se me ha olvidado escribir palabras repetidas vaya!!"
        // Ej. 2- Frase con una palabra repetida (frecuencia de aparcion > 1): 
        // "Se me ha olvidado escribir palabras repetidas vaya!! vaya!!"
        // Ej. 3- Frase con varias palabras repetidas: 
        // "Se me ha olvidado escribir palabras repetidas vaya!! vaya!! se me ha olvidado!!"
        String texto = teclado.nextLine();
        
        // PRIMERA DIFERENCIA CON RESPECTO A Test1Map Y Test2Map:
        // Al intervenir la frecuencia de las palabras en el problema, para
        // ajustar mejor la talla de la TablaHash a crear, se divide primero 
        // el texto en las diferentes palabras distintas que lo componen (i.e.
        // (la talla maxima estimada del Map o la TablaHash que lo implementa
        String[] palabrasTexto = texto.split(" +");
        
        // SEGUNDA DIFERENCIA CON RESPECTO A Test1Map Y Test2Map:
        // Al intervenir la frecuencia de las palabras en el problema, el 
        // tipo del Valor de las Entradas del Map ya NO puede ser String 
        // (como el de la Clave): obligatoriamente, ES Integer
        librerias.estructurasDeDatos.modelos.Map<String, Integer> m = 
            new TablaHash<String, Integer>(palabrasTexto.length);
        
        // TERCERA DIFERENCIA CON RESPECTO A Test1Map Y Test2Map:
        // Al intervenir la frecuencia de las palabras en el problema, la 
        // construccion del Map es un poco mas sofisticada: conforme van 
        // apareciendo repeticiones de las palabras del texto, hay que 
        // actualizar los Valores de las Entradas del Map
        for (int i = 0; i < palabrasTexto.length; i++) { 
            String palabra = palabrasTexto[i].toLowerCase();
            // **OJO** frec SOLO puede ser mas de tipo Integer: si pones int,
            // luego NO puedes preguntar si frec == null: se produce un error
            // de compilacion en la linea del if con el siguiente mensaje:
            // incomparable types: int and <nulltype>
            // Y si preguntas si frec == 1, por ejemplo, la JVM lanza 
            // NullPointerException al ejecutar m.recuperar(palabra)
            Integer frec = m.recuperar(palabra); 
                                                
            if (frec == null) { m.insertar(palabra, 1); }
            else  { m.insertar(palabra, ++frec); }
            // **OJO EN EL ELSE** PUEDES escribir frec+1 en vez de ++frec
            // PERO JAMAS frec++, pues el valor de frec SOLO se
            // incrementara cuando termine la ejecucion del metodo,
            // por lo que no se modificara el Valor de la Entrada 
            // existente y el programa NO funcionara 
        }
            
        // CUARTA DIFERENCIA CON RESPECTO A Test1Map y Test2Map:
        // - Con respecto a Test2Map, NO BASTA con mostrar m.talla(),
        //   SINO que hay que usar m.claves() para acceder a sus claves 
        // - Con respecto a Test1Map, NO BASTA con un m.claves().toString(),
        //   SINO que hay que seleccionar aquellas claves cuya frecuencia  
        //   sea mayor que 1 y, ademas, acceder a su valor. Solo asi se  
        //   podra mostrar por pantalla tanto la clave como su frecuencia
        ListaConPI<String> claves = m.claves(); 
        String listaRepetidas = "";
        // **OJO** Si el bucle de recorrido de claves va sobre su talla, ES  
        // IMPRESCINDIBLE situarse ANTES en su inicio y pasar al siguiente  
        // tras recuperar. Por eso, para que no se nos olvide ninguna de  
        // estas instrucciones, es recomendable usar el siguiente for
        for (claves.inicio(); !claves.esFin(); claves.siguiente()) {
            String clave = claves.recuperar();
            Integer frec = m.recuperar(clave);
            if (frec.intValue() > 1) {
                listaRepetidas += "(" + clave + ", " + frec + ")\n";
            }
        }
        if (listaRepetidas.length() > 0) {
            System.out.println("Palabras repetidas en el texto y su frecuencia"
                               + "de aparicion:\n" + listaRepetidas);
        } else { 
            System.out.println("NO hay palabras repetidas en el texto"); 
        }
    }
}