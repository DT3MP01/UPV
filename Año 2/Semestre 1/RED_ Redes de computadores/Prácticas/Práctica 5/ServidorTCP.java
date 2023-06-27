import java.net.*;
import java.io.*;
import java.util.Scanner;
/**
 * Write a description of class SequencialTCP here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class ServidorTCP {
    public static void main(String args[]) {
        try {
            ServerSocket ss = new ServerSocket(8000);
            while(true) {
                Socket s = ss.accept(); // espera un cliente
                
                Scanner recibe = new Scanner(s.getInputStream());
                String str = recibe.nextLine();
                
                PrintWriter envia = new PrintWriter(s.getOutputStream());
                envia.printf(str + "\n");
                System.out.println("Se ha conectado un cliente al servidor\r\n");
                System.out.println("IP del Socket: " + s.getInetAddress());
                System.out.println("Puerto del Socket: " + s.getPort());
                
                System.out.println("IP del ServerSocket: " + ss.getInetAddress());
                System.out.println("Puerto del ServerSocket: " + ss.getLocalPort());
                envia.flush();
                
                s.close();
            }
        } catch (IOException e) { 
            System.out.println(e);
        }
    }
}