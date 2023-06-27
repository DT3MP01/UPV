
public class Test{
    
    public static void main(String[] args) {      
        NodeInt sec1 = null;
        sec1 = new NodeInt(10);
        NodeInt.mostrar(sec1);
        sec1 = new NodeInt(5, sec1);
        NodeInt.mostrar(sec1);
        sec1 = new NodeInt(-2, sec1);    
        NodeInt.mostrar(sec1);
 
        NodeInt sec = null;
        NodeInt ultimo = null; 
        sec = new NodeInt(10); 
        ultimo = sec;
        ultimo.next = new NodeInt(5); 
        ultimo = ultimo.next;         
        ultimo.next = new NodeInt(-2);
        ultimo = ultimo.next; 
        NodeInt.mostrar(sec);
    
        System.out.println("\nSaturar:");
        NodeInt.saturar(sec, 8);
        NodeInt.mostrar(sec);        
        
        System.out.println("\nBuscar nodos:");
        NodeInt segundo = NodeInt.buscar(sec, 2);
        NodeInt tercero = NodeInt.buscar(sec, 3);
        
        if (segundo != null) {
            System.out.println("segundo = " + segundo.data);
        } 
        else {
            System.out.println("segundo no existe");
        }
        
        if (tercero != null) {
            System.out.println("tercero = " + tercero.data);
        } 
        else {
            System.out.println("tercero no existe");
        }
        
        System.out.println("\nInsertar nodos:");
        NodeInt secB = null;
        
        for (int i = 0; i < 10; i++) {
            secB = NodeInt.insertar(secB, 2 * i, i);
        }
        
        NodeInt.mostrar(secB);
        
        secB = NodeInt.insertar(secB, -4, 11);
        secB = NodeInt.insertar(secB, -7, 2);
        secB = NodeInt.insertar(secB, -3, 0);
        secB = NodeInt.insertar(secB, -9, 12);
        NodeInt.mostrar(secB);
        
        System.out.println("\nInsertar nodos en orden:");
        NodeInt secC = null;
        secC = NodeInt.insertar(secC, 4);
        secC = NodeInt.insertar(secC, -3);
        secC = NodeInt.insertar(secC, 1);
        secC = NodeInt.insertar(secC, 0);
        secC = NodeInt.insertar(secC, 8);
        secC = NodeInt.insertar(secC, 6);
        secC = NodeInt.insertar(secC, 1);
        NodeInt.mostrar(secC);
        
        System.out.println("\nBorrar nodos:");
        secC = NodeInt.borrar(secC, 4);
        secC = NodeInt.borrar(secC, 1);
        secC = NodeInt.borrar(secC, 7);
        NodeInt.mostrar(secC);
        
        System.out.println("\nBorrar nodos inferiores a umbral:");
        secB = NodeInt.borrar2(secB, 0);
        NodeInt.mostrar(secB);
    }
}