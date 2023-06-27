import java.net.*;
import java.io.*;
import java.util.*;

/**
 * Write a description of class ClienteEco here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class ClienteEco {
    public static void main(String[] args) throws UnknownHostException, IOException {
        try {
            Socket s = new Socket("zoltar.redes.upv.es", 7);
        
            Scanner sc = new Scanner(s.getInputStream());
        
            OutputStream os = s.getOutputStream();
            PrintWriter pw = new PrintWriter(os, false);
        
            pw.println("¡¡Hola, mundo!!");
            pw.flush();
            System.out.println(sc.nextLine());
            
            s.close();
        } catch (IOException i) {
            System.out.println("No hay mas lineas");
        }
    }
}
