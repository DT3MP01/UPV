
 

import java.util.NoSuchElementException;
/**
 * StackIntArray: Implementació basada en arrays de l'estructura de dades 
 * lineal Pila d'enters.
 * 
 * @author PRG
 * @version Curs 2017/18
 */
public class StackIntArray {
    private static final int MAX = 10;   // dimensió màxima de l'array
    private int[] theArray;
    private int top;

    /**
     * Crea una pila buida.
     */
    public StackIntArray() {
        theArray = new int[MAX];
        top = -1;
    }

    /**
     * Empila un nou element en la pila.
     * @param x, int a empilar en la pila actual.
     */
    public void push(int x) {
        if (top + 1 == theArray.length) { duplicateArray(); }
        top++;
        theArray[top] = x;
    }
    
    private void duplicateArray() {
        int[] aux = new int[2 * theArray.length];
        for (int i = 0; i < theArray.length; i++) {
            aux[i] = theArray[i];
        }
        theArray = aux;
    }

    /**
     * Torna i desempila el top de la pila.
     * @throws NoSuchElementException si la pila está buida.
     * @return int, dada de l'element top desempilat de la pila actual.
     */
    public int pop() {
        if (top < 0) {
            throw new NoSuchElementException("Empty Stack");
        }
        int x = theArray[top];
        top--;
        return x;
    }

    /**
     * Torna l'element top de la pila actual.
     * @throws NoSuchElementException si la pila está buida.
     * @return int, dada de l'element top de la pila actual.
     */
    public int peek() { 
        if (top < 0) {
            throw new NoSuchElementException("Empty Stack");
        }
        return theArray[top]; 
    }

    /**
     * Comprova si la pila actual està o no buida. 
     * @return boolean, true si la pila està buida i false en cas contrari.
     */
    public boolean empty() { return top == -1; }

    /**
     * Torna el número d'elements de la pila actual.
     * @return int, número d'elements de la pila actual.
     */
    public int size() { return top + 1; }
    
    /**
     * Comprova si la pila actual és igual o no a una pila donada.
     * @param o Object que representa la pila a comparar.
     * @return boolean, true si són iguals i false en cas contrari.
     */
    public boolean equals(Object o) {
        boolean igual = false;
        if (o instanceof StackIntArray) {
            StackIntArray p = (StackIntArray) o;
            if (this.size() != p.size()) { return false; }
            else {
                int i = 0;
                while (i <= top && theArray[i] == p.theArray[i]) { i++; } 
                igual = i > top;
            }           
        }
        return igual;
    }
     
    public String toString() {
        String res = "";
        for (int i = top; i >= 0; i--) {
            res += theArray[i] + "\n";
        }
        return res;
    }    
}
