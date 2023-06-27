import java.util.*;
import java.io.*;
import java.net.*;

public class clienteUDP2 {
   public static void main(String[] args) {
       String ms = new String("Josep Molina animeMan\n");
       
       try {
           DatagramSocket s = new DatagramSocket();
           DatagramPacket dp = new DatagramPacket(ms.getBytes(),
           ms.getBytes().length, InetAddress.getByName("localhost"), 7777);
           s.send(dp);
       } catch (IOException e) {
           System.out.println("Hola, soy Joseppo de nuevo. Saludos terrestres");
       }
    }
}
