 

import java.util.NoSuchElementException;
/**
 * QueueIntLinked: Implementació enllaçada de l'estructura de dades 
 * lineal Cua d'enters.
 * 
 * @author PRG
 * @version Curs 2017/18
 */
public class QueueIntLinked {
    private NodeInt first, last; // referència al first i últim elements 
                                   // de la cua (punts d'acces a la cua)
    private int size;             // número d'elements de la cua

    /**
     * Crea una cua buida.
     */
    public QueueIntLinked() {
        first = null;
        last = null;
        size = 0;
    }

    /**
     * Encua un nou element en la cua.
     * @param x, int a add en la cua actual.
     */
    public void add(int x) {
        NodeInt nou = new NodeInt(x);
        if (last != null) { last.next = nou; }
        else { first = nou; }
        last = nou;
        size++;
    }

    /**
     * Torna i desencua el first de la cua.
     * @throws NoSuchElementException si la cua està buida.
     * @return int, data de l'element first desencuat de la cua actual.
     */
    public int remove() {
        if (size == 0) { 
            throw new NoSuchElementException("Cua buida");
        }
        int x = first.data;
        first = first.next;
        if (first == null) { last = null; }
        size--;
        return x;
    }
    
    /**
     * Torna la data de l'element first de la cua actual.
     * @throws NoSuchElementException si la cua está buida.
     * @return int, data de l'elemento first de la cua actual.
     */
    public int first() { 
        if (size == 0) { 
            throw new NoSuchElementException("Cua buida");
        }
        return first.data; 
    }

    /**
     * Comprova si la cua actual està o no buida.
     * @return boolean, true si la cua està buida i false en cas contrari.
     */
    public boolean empty() { return (first == null); }
    
    /**
     * Torna el número d'elements de la cua actual.
     * @return int, número d'elements de la cua actual.
     */
    public int size() { return size; }
    
    /**
     * Comprova si la cua actual és igual o no a una cua donada.
     * @param o Object que representa la cua a comparar.
     * @return boolean, true si són iguals i false en cas contrari.
     */
    public boolean equals(Object o) {
        boolean igual = false;
        if (o instanceof QueueIntLinked) {
            if (size == ((QueueIntLinked) o).size) { 
                NodeInt p = first, aux = ((QueueIntLinked) o).first;
                while (p != null && p.data == aux.data) {
                    p = p.next;
                    aux = aux.next;
                }
                if (p == null) { igual = true; }
            }
        }
        return igual;
    }
        
    /**
     * Torna una String formada pels valors de la QueueIntLinked.
     * @return String amb les dades de la cua.
     */
    public String toString() {
        String s = "";
        NodeInt p = first;
        while (p != null) {
            s += String.format("%4d", p.data);
            p = p.next;
        }
        return s;
    }    

}

