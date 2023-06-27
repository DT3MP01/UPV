import java.net.*;
import java.io.*;
import java.util.*;

/**
 * Write a description of class ClienteSMTP here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class ClienteSMTP {
    public static void main(String[] args) throws UnknownHostException, IOException {
        try {
            Socket s = new Socket("smtp.upv.es", 25);
        
            Scanner sc = new Scanner(s.getInputStream());
            System.out.println(sc.nextLine());
            
            OutputStream os = s.getOutputStream();
            PrintWriter pw = new PrintWriter(os, true);
        
            pw.println("HELO 158.42.180.2.redes.upv.es");
            sc.nextLine();
            
            
            s.close();
        } catch (IOException i) {
            System.out.println("No hay mas lineas");
        }
    }
}
