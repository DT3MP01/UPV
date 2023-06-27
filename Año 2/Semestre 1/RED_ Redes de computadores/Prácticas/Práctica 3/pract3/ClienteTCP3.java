import java.net.*;
import java.io.IOException;
import java.util.*;

public class ClienteTCP3 {
    public static void main(String[] args) throws UnknownHostException, IOException {
        try {
            Socket s = new Socket("www.upv.es", 81);
            System.out.println("Conectado de nuevo");
            
            s.close();
        } catch (UnknownHostException h) {
            System.out.println("Nombre de servidor desconocido");
        } catch (NoRouteToHostException r) {
            System.out.println("No es posible realizar la conexion");
        }
    }
}
