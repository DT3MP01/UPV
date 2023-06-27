import java.util.NoSuchElementException;

/**
 * StackIntLinked: Implementació enllaçada de l'estructura de dades 
 * lineal Pila d'enters.
 * 
 * @author PRG
 * @version Curs 2017/18
 */
public class StackIntLinked {
    private NodeInt top;  // referència al top de la pila (punt d'acces)
    private int size;    // número d'elements de la pila

    /**
     * Crea una pila vacía.
     * Constructor por defecto
     */
    public StackIntLinked() {
        top = null;
        size = 0;
    }
    
        /**
     * Comprova si la pila actual està o no buida. 
     * @return boolean, true si la pila està buida i false en cas contrari.
     */
    public boolean empty() { 
        return (top == null);  
        // o return (size == 0);
    }
    
    /**
     * Torna el número d'elements de la pila actual.
     * @return int, número d'elements de la pila actual.
     */
    public int size() { 
        return this.size;
    }
    
    /*Devuelve el contenido del último elemento de la pila, es decir, el top
    public int top() {
        if (isEmpty()) {
            throw new NoSuchElementException("Empty Stack");
        } else {
            return top.getElemento();
        }
    }
    */
    
    /**
     * Torna la dada de l'element top de la pila actual.
     * @throws NoSuchElementException si la pila està buida. 
     * @return int, dada de l'element top de la pila actual.
     */
    public int peek() { 
        if (top == null) { 
            throw new NoSuchElementException("Empty Stack");
        }
        return top.data;
    }
    
    /**
     * Añade un nuevo elemento a la pila. 
     * @param x, int a empilar en la pila actual.
     */
    public void push(int elemento) {
        top = new NodeInt(elemento, top);
        size++;
    }
    
    /**
     * Saca un elemento, devuelve su contenido y lo elimina.
     * @throws NoSuchElementException si la pila està buida.
     * @return int, dada de l'element top desempilat de la pila actual.
     */
    public int pop() {
        if (empty()) {
            throw new NoSuchElementException("Empty Stack");
        }
        int elemento = top.getElemento(); //1º: "capturar" al elemento
        top = top.next; //2º: borrarlo, referenciándolo al siguiente
        size--; //3º: disminuir el tamaño
        return elemento; //4º: devolver el elemento
    }
    
     /**
     * Comprova si la pila actual és igual o no a una pila donada.
     * @param o Object que representa la pila a comparar.
     * @return boolean, true si són iguals i false en cas contrari.
     */
    public boolean equals(Object o) {
        boolean igual = false;
        if (o instanceof StackIntLinked) {
            StackIntLinked p = (StackIntLinked) o;
            if (this.size != p.size) { return false; }
            else {
                int i = 0;
                NodeInt a = this.top; 
                NodeInt b = p.top;
                while (a != null && a.data == b.data) { 
                    a = a.next;
                    b = b.next;
                } 
                igual = a == null;
            }           
        }
        return igual;
    }
    
    public String toString() {
        String res = "";
        for (NodeInt i = top; i != null; i = i.next) {
            res += i.data + "\n";
        }
        return res;
    }
    
    /*
     public String toString() {
        if (isEmpty()) {
            return "La pila está vacía";
        } else {
            String res = "";
            NodeInt aux = top;
            while (aux != top) {
                res += aux.toString();
                aux = aux.getNext();
            }
            return res;
        }
    }
    */
}
