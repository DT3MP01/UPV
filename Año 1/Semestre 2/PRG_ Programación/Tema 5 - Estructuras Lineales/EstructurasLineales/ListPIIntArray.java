 

import java.util.NoSuchElementException;
/**
 * ListPIIntArray : Implementació amb array de l'estructura de dades 
 * lineal Llista amb punt d'interès d'enters.
 * 
 * @author PRG
 * @version Curs 2017/18
 */
public class ListPIIntArray  {
    private static final int MAX = 10;  // dimensió màxima de l'array
    private int[] theArray;   // array utililitzat per emmagatzemar 
                            // les dades de la llista
    private int pI;         // posició del punt d'interès 
                            // (punt d'acces als elements de la llista)
    private int size;      // número d'elements de la llista
    
    /**
     * Crea una llista buida.
     */
    public ListPIIntArray() {
        theArray = new int[MAX];
        pI = 0;
        size = 0;
    }

    /**
     * Comprova si la llista actual està o no buida.
     * @return boolean, true si la llista està buida i false en cas contrari.
     */
    public boolean empty() { return size == 0; }
    
    /**
     * Comprova si el punt d'interès està al final de la llista actual.
     * @return boolean, true si el PI està al final de la llista i false 
     * en cas contrari.
     */
    public boolean isEnd() { return pI == size; }
    
    /**
     * Torna el número d'elements de la llista actual.
     * @return int, número d'elements de la llista actual.
     */
    public int size() { return size; }      

    /**
     * Situa el punt d'interès en la primera posició de la llista actual.
     */
    public void begin() { pI = 0; }
    
    /**
     * Desplaça el PI una posició cap a la dreta. 
     * @throws NoSuchElementException si el PI es troba al final de la llista.
     */
    public void next() {
        if (pI == size) {
            throw new NoSuchElementException("Cursor al final");
        }
        pI++; 
    }
    
    /**
     * Torna l'element en el PI. 
     * @throws NoSuchElementException si el PI es troba al final de la llista.
     * @return int, element en el PI de la llista.
     */
    public int get() { 
        if (pI == size) {
            throw new NoSuchElementException("Cursor al final");
        }
        return theArray[pI]; 
    }
    
    /**
     * Insereix l'element x en el PI. 
     * Hi ha que desplaçar a la dreta totes les dades des del PI 
     * fins el final de la llista.
     * @param x, element a afegir en la llista.
     */
    public void insert(int x) {
        if (size == theArray.length) { duplicateArray(); }
        for (int k = size - 1; k >= pI; k--) {
            theArray[k + 1] = theArray[k];
        }
        theArray[pI] = x; 
        pI++;
        size++;
    }
    
    private void duplicateArray() {
        int[] aux = new int[2 * theArray.length];
        for (int i = 0; i < theArray.length; i++) {
            aux[i] = theArray[i];
        }
        theArray = aux;
    }
    
    /**
     * Torna i elimina de la llista l'element en el PI. 
     * Hi ha que desplaçar a la esquerra totes les dades des del PI 
     * fins el final de la llista. 
     * @throws NoSuchElementException si el PI es troba al final de la llista.
     * @return int, element en el PI de la llista.
     */
    public int remove() {
        if (pI == size) {
            throw new NoSuchElementException("Cursor al final");
        }
        int aux = theArray[pI];
        for (int k = pI + 1; k < size; k++) {
            theArray[k - 1] = theArray[k];
        }
        size--;
        return aux; 
    }    
    
    
    
    /**
     * Dues llistes son iguals si son iguals tots els elements 
     * i en el mateix ordre
     */
    public boolean equals(Object o) {
        boolean answer = false;
        if (o instanceof ListPIIntArray) {
            ListPIIntArray other = (ListPIIntArray) o;
            answer = (this.size == other.size);
            for (int i = 0; i < size && answer; i++) {
                answer = (this.theArray[i] == other.theArray[i]);
            }
        }
        return answer;
    }
    
    
    /**
     * Torna un String amb els elements de la llista
     */    
    public String toString() {
        String s = "";
        int p = 0;
        while(p < size) {
            if (p == pI)   { s += " [" + theArray[p] + "]"; }
            else           { s += " " + theArray[p]; }
            p++;
            if (p != size) { s += ","; }
        }
        return s;
     }    
    
}
