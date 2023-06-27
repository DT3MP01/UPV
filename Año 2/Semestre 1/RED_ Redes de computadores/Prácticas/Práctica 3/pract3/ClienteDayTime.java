import java.net.*;
import java.io.IOException;
import java.util.*;

/**
 * Write a description of class ClienteDayTime here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class ClienteDayTime {
    public static void main(String[] args) throws UnknownHostException, IOException{
        Socket s = new Socket("zoltar.redes.upv.es", 13);
        System.out.println("Conectado\n");
        
        Scanner sc = new Scanner(s.getInputStream());
        System.out.println(sc.nextLine());
        
        s.close();
    }
}
