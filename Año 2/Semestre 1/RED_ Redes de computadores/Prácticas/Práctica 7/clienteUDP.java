import java.util.*;
import java.io.*;
import java.net.*;

public class clienteUDP {
   public static void main(String[] args) {
       try {
           DatagramSocket ds = new DatagramSocket();
           int p = ds.getLocalPort();
           System.out.println(p);
       } catch (IOException e) {
           System.err.println("Hola, me llamo Josep y he salido a la luz");
       }
   }
}
