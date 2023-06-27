import java.util.Scanner; 
import java.util.Locale;

/** Ejemplo uso ifs: 
 *  comparar la distancia al origen de dos puntos 
 */
public class TestIfs {

    public static void main(String[] args) { 
        PuntoR p1 = new PuntoR(4, 5); 
        PuntoR p2 = new PuntoR();
        double dOp1 = p1.distOrigen(); 
        double dOp2 = p2.distOrigen();
        if (dOp1 > dOp2) {
            System.out.println("p1 esta a mayor distancia del origen que p2");
        } else if (dOp1 < dOp2) { 
            System.out.println("p1 esta a menor distancia del origen que p2");
        } else {
            System.out.println("p1 y p2 estan a igual distancia del origen");
        }    
    }

}
