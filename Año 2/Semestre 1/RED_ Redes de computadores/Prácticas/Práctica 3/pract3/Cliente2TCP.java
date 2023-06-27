import java.net.*;
import java.io.IOException;
import java.util.*;

/**
 * Write a description of class ClienteTCP1 here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class Cliente2TCP {
    public static void main(String[] args) throws UnknownHostException, IOException{
        Socket s = new Socket("www.upv.es", 81);
        System.out.println("Connected");
        
        s.close();
    }
}