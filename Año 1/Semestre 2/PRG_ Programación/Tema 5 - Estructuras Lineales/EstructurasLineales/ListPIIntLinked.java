 

import java.util.NoSuchElementException;
/**
 * ListPIIntLinked: Implementació enllaçada de l'estructura de dades 
 * lineal Llista amb punt d'interès d'enters.
 * 
 * @author PRG
 * @version Curs 2017/18
 */
public class ListPIIntLinked {
    // referencies al first, al PI i a l'anterior de la llista
    protected NodeInt first, pI, prevPI;    
    protected int size;       // número d'elements de la llista
    
    /**
     * Crea una llista buida.
     */
    public ListPIIntLinked() {
        first = null;
        pI = null;
        prevPI = null;
        size = 0;
    }

    /**
     * Comprova si la llista actual està o no buida.
     * @return boolean, true si la llista està buida i false en cas contrari.
     */
    public boolean empty() { 
        return size == 0;   // Alternativament: return first == null;
    }
    
    /**
     * Comprova si el punt d'interès està al final de la llista actual.
     * @return boolean, true si el PI està al final de la llista i false 
     * en cas contrari.
     */
    public boolean isEnd() { return pI == null; }
    
    /**
     * Torna el número d'elements de la llista actual.
     * @return int, número d'elements de la llista actual.
     */
    public int size() { return size; }      

    /**
     * Situa el punt d'interès en la firsta posició de la llista actual.
     */
    public void begin() { 
        pI = first; 
        prevPI = null; 
    }

    /**
     * Desplaça el PI una posició cap a la dreta. 
     * @throws NoSuchElementException si el PI es troba al final de la llista.
     */
    public void next() { 
        if (pI == null) { 
            throw new NoSuchElementException("Point of Interest at the end");
        }
        prevPI = pI; 
        pI = pI.next;
    }
    
    /**
     * Torna l'element en el PI. 
     * @throws NoSuchElementException si el PI es troba al final de la llista.
     * @return int, element en el PI de la llista.
     */
    public int get() { 
        if (pI == null) { 
            throw new NoSuchElementException("Point of Interest at the end");
        }
        return pI.data; 
    }   

    /**
     * Insereix un nou node amb l'element x en la posició anterior al PI. 
     * Si el cursor està a l’inici, el nou node serà el first de la 
     * llista. En qualsevol altre cas, el nou node s’insereix entre el 
     * node cursor i el seu node predecessor.
     * @param x, element a afegir en la llista.
     */
    public void insert(int x) {
        if (pI == first) { 
            first = new NodeInt(x, pI); 
            prevPI = first; 
        } 
        else { 
            prevPI.next = new NodeInt(x, pI); 
            prevPI = prevPI.next; 
        } 
        size++;
    }
    
    /**
     * Torna i elimina de la llista l'element en el PI. 
     * Si el cursor està a l’inici, first s’actualitza al seu node 
     * següent. En qualevol altre cas, els nodes anterior i posterior 
     * al node cursor queden enllaçats.
     * @throws NoSuchElementException si el PI es troba al final de la llista.
     * @return int, element en el PI de la llista.
     */
    public int remove() {
        if (pI == null) { 
            throw new NoSuchElementException("Cursor al final");
        }
        int x = pI.data; 
        if (pI == first) { first = first.next; }
        else { prevPI.next = pI.next; }
        pI = pI.next; 
        size--; 
        return x;
    }
  
    /**
     * Dues llistes son iguals si son iguals tots els elements 
     * i en el mateix ordre
     */
    public boolean equals(Object o) {
        boolean answer = false;
        if (o instanceof ListPIIntLinked) {
            ListPIIntLinked other = (ListPIIntLinked) o;
            NodeInt b = other.first;
            NodeInt a = this.first;
            answer = (this.size == other.size);
            while (a != null && answer) {
                answer = (a.data == b.data);
                a = a.next; b = b.next;
            }       
        }
        return answer;
    }
    
    /**
     * Torna un String amb els elements de la llista
     */    
    public String toString() {
        String s = "";
        NodeInt p = first;
        while (p != null) {
            if (p == pI)   { s += " [" + p.data + "]"; }
            else           { s += " " + p.data; }
            p = p.next;
            if (p != null) { s += ","; }
        }
        return s;
    }    
    
}
