import java.util.*;
import java.io.*;
import java.net.*;

/**
 * Write a description of class clienteUDP4 here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class clienteUDP4 {
    public static void main(String[] args) {
       Date now = new Date();
       String now_string = now.toString() + "\r\n";
       
       try {
           DatagramSocket s = new DatagramSocket(7778);
           DatagramPacket dp = new DatagramPacket(now_string.getBytes(), now_string.getBytes().length);
           //s.send(dp);
           //s.setSoTimeout(10000);
           
           s.receive(dp);
           
           dp.setData(now_string.getBytes());
           dp.setLength(now_string.getBytes().length);
           
           s.send(dp);
           
           //Por pantalla
           String str = new String(dp.getData(), 0, dp.getLength());
           System.out.println(str);
       } catch (IOException e) {
           System.out.println("He fallado, tristemente");
       }
    }
}
