import java.net.*;
import java.io.IOException;
import java.util.*;

/**
 * Write a description of class ClienteTCP1 here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class ClienteTCP2 {
    public static void main(String[] args) throws UnknownHostException, IOException{
        Socket s = new Socket("wwww.upv.es", 80);
        System.out.println("Connected");
        
        s.close();
    }
}