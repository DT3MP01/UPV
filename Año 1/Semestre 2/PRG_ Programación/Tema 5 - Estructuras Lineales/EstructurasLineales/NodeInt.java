/**
 * Classe NodeInt: Representació d'una estructura que associa 
 * una dada (de tipus int) i l'enllaç a la dada següent.
 * 
 * @author PRG
 * @version Curs 2017/18
 */
class NodeInt {
    protected int data;        // dada del node
    protected NodeInt next;    // enllaç al següent node
    
    /** Constructor A: crea un node amb una dada d i que no té següent. 
     *  @param d int que representa la dada del nou node.
     */ 
    // Constructor parcial
    
    NodeInt(int data) { 
        this.data = data;
        this.next = null;
        // de manera equivalente --> this(d, null);
    } 
    
    /** Constructor B: crea un node amb una dada d, enllaçat a un node 
     *  preexistent s. 
     *  @param d int que representa la dada del nou node.
     *  @param s NodeInt amb el qual enllaçar el nou node.
     */ 
    //Constructor total
    
    NodeInt(int data, NodeInt next) { 
        this.data = data; 
        this.next = next; 
    }   
   
    // ¡¡Nuevos metodos!!    
   
    public int getElemento() {
        return data;
    }
    
    public NodeInt getNext() {
        return next;
    }
    
    public String toString() {
        return data + "\n";
    }
    
    public static void mostrar(NodeInt sec) { 
        NodeInt aux = sec;
        while (aux != null) {
            System.out.print(aux.data + ", ");
            aux = aux.next;
        }
        System.out.println();
    } 
    
    public static void saturar(NodeInt sec, int maximo) { 
        NodeInt aux = sec;
        while (aux != null) {
            if (aux.data > maximo) { aux.data = maximo; }
            aux = aux.next;
        }
    }
   // Dada la posicion
    public static NodeInt buscar(NodeInt sec, int i) {
        NodeInt aux = sec; 
        int k = 0;
        while (aux != null && k < i) {
            aux = aux.next;
            k++;
        }
        return aux;
    }
    
    
     // dado el dato
     public static NodeInt buscar3(NodeInt sec, int dato) {
        NodeInt aux = sec; 
        while (aux != null && aux.data!=dato) {
            aux = aux.next;
            
        }
        return aux;
    }
   
    public static NodeInt insertar(NodeInt sec, int d, int i) {
        if (i == 0)
             { sec = new NodeInt(d, sec); }
        else { 
            NodeInt aux = sec; 
            int k = 0;
            while (aux != null && k < i - 1) {
                aux = aux.next; 
                k++;
            }
            if (aux != null) {
                aux.next = new NodeInt(d, aux.next);
            }
        }
        return sec;
    }

    public static NodeInt insertar(NodeInt sec, int d) {
        NodeInt aux = sec; 
        NodeInt ant = null;  
        while (aux != null && aux.data < d) {
            ant = aux; 
            aux = aux.next;  
        }
        if (aux == sec) {
            sec = new NodeInt(d, sec); 
        } 
        else {
            ant.next = new NodeInt(d, aux); 
        }
        return sec;
    }
  
    public static NodeInt borrar(NodeInt sec, int d) {
        NodeInt aux = sec;
        NodeInt ant = null;
        while (aux != null && aux.data != d) {
            ant = aux;
            aux = aux.next;
        }
        if (aux != null) { // exito en la busqueda
            if (aux == sec)
                { sec = sec.next; }
            else 
                { ant.next = aux.next; }
        }
        // parametro sec puede cambiar, devolver su valor
        return sec;
    }

    public static NodeInt borrar2(NodeInt sec, int umbral) {
        NodeInt aux = sec;
        NodeInt ant = null;
        while (aux != null) {
            if (aux.data < umbral) { // Node a borrar
                if (aux == sec) { sec = sec.next; }
                else { ant.next = aux.next; }
                // ant no se actualiza
            } 
            else { ant = aux; }
            aux = aux.next;
        }
        // parametro sec puede cambiar, devolver su valor
        return sec;  
    }
}
