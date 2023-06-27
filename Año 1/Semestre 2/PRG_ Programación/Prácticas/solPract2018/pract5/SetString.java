package pract5;

/**
 * Clase SetString. Implementacion de un
 * conjunto de String mediante una secuencia
 * enlazada ordenada lexicograficamente.
 *
 * @author (PRG. ETSINF. UPV)
 * @version (Curso 2017/18)
 */
public class SetString {
    
    private NodeString first;
    private int size;
    
    /**
     * Crea un conjunto vacio.
     */
    public SetString() {
        this.first = null;
        this.size = 0;
    }

    /**
     * Inserta s en el conjunto.
     * Si s ya pertenece al conjunto, el conjunto no cambia.
     *
     * @param s String. Elemento que se inserta en el conjunto.
     */
    public void add(String s) {
        NodeString aux = this.first;
        NodeString prev = null;
        int compare = -1; // el valor de la comparacion
        while (aux != null && compare < 0) {
            compare = aux.data.compareTo(s); 
            if (compare < 0) {
                prev = aux;
                aux = aux.next;
            } 
        } // aux == null o s anterior o igual a aux.data  
        
        if (compare != 0) { // s menor que aux.data o s mayor que todos
            NodeString node = new NodeString(s, aux);
            if (aux == this.first) {
                this.first = node;
            } else { prev.next = node; }
            this.size++;
        }
    }
    
    /**
     * Comprueba si s pertenece al conjunto.
     *
     * @param s String.
     * @return true sii s pertenece al conjunto.
     */
    public boolean contains(String s) {
        NodeString aux = this.first;
        int compare = -1;
        while (aux != null && compare < 0) {
            compare = aux.data.compareTo(s); 
            if (compare < 0) { aux = aux.next; }            
        }
        return (compare == 0);  
    }

//     /* FORMA ALTERNATIVA: */
//     public boolean contains(String s) {
//         NodeString aux = this.first;
//         while (aux != null && s.compareTo(aux.data) > 0) {
//             aux = aux.next;            
//         }
//         return (aux != null && s.compareTo(aux.data) == 0);  
//     }    
    
    
    /**
     * Elimina s del conjunto.
     * Si s no pertenece al conjunto, el conjunto no cambia.
     *
     * @param s String.
     */
    public void remove(String s) {
        NodeString aux = this.first;
        NodeString prev = null;
        int compare = -1; // el valor de la comparacion
        while (aux != null && compare < 0) {
            compare = aux.data.compareTo(s); 
            if (compare < 0) {
                prev = aux;
                aux = aux.next;
            } 
        }
        if (compare == 0) {
            if (aux == this.first) {
                this.first = this.first.next;
            } else { prev.next = aux.next; }
            this.size--;
        }           
        
    }
    
    /**
     * Devuelve la talla o cardinal del conjunto.
     * @return la talla del conjunto.
     */
    public int size() { return this.size; }
    
    
    /**
     * Devuelve el conjunto interseccion del conjunto y del otro conjunto.
     *
     * @param other SetString.
     * @return el conjunto interseccion.
     */
    public SetString intersection(SetString other) {
        SetString result = new SetString();
        NodeString aux1 = this.first;
        NodeString aux2 = other.first;
        NodeString lastResult = null;
        while (aux1 != null && aux2 != null) {
            String s1 = aux1.data, s2 = aux2.data;
            int compare = s1.compareTo(s2);
            if (compare < 0) { aux1 = aux1.next; }
            else if (compare > 0) { aux2 = aux2.next; }
            else { 
                aux1 = aux1.next; aux2 = aux2.next;
                NodeString node = new NodeString(s1);
                if (lastResult == null) { 
                    result.first = node; 
                    lastResult = node; 
                } else { lastResult.next = node; lastResult = node; }
                result.size++;
            }
        }
        return result;
    }
    
    /**
     * Devuelve el conjunto union del conjunto y del otro conjunto.
     *
     * @param other SetString.
     * @return el conjunto union.
     */
    public SetString union(SetString other) {
        SetString result = new SetString();
        NodeString aux1 = this.first;
        NodeString aux2 = other.first;
        NodeString lastResult = null;
        while (aux1 != null && aux2 != null) {
            String s1 = aux1.data, s2 = aux2.data, s3 = null;
            int compare = s1.compareTo(s2);
            if (compare < 0) { s3 = s1; aux1 = aux1.next; }
            else if (compare > 0) { s3 = s2; aux2 = aux2.next; }
            else { s3 = s1; aux1 = aux1.next; aux2 = aux2.next; }
            
            // Insertar s3 al final de result:
            NodeString node = new NodeString(s3);
            if (lastResult == null) { 
                result.first = node; 
                lastResult = node; 
            } else { lastResult.next = node; lastResult = node; }
            result.size++;
        }
        
        NodeString aux;
        if (aux1 != null) { aux = aux1; } else { aux = aux2; }
        while (aux != null) {
            String s = aux.data; aux = aux.next;
            NodeString node = new NodeString(s);
            if (lastResult == null) { 
                result.first = node;
                lastResult = node; 
            } else { lastResult.next = node; lastResult = node; }
            result.size++;
        }
            
        return result;
    }
    
    
    
    /**
     * Devuelve el listado de los Strings en el conjunto, en orden
     * lexicográfico, y separados por saltos de linea.
     * Si el conjunto es vacio devuelve "", la String vacia.
     *
     * @return el listado de los elementos del conjunto.
     */
    public String toString() {
        String result = "";
        NodeString aux = this.first;
        while (aux != null) {
            result += aux.data + "\n"; 
            aux = aux.next; 
        }
        return result;
    }
    
}
