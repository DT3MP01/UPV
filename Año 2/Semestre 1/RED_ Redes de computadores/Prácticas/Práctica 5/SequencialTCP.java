import java.net.*;
import java.io.*;
import java.util.Scanner;
/**
 * Write a description of class SequencialTCP here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class SequencialTCP {
    public static void main(String args[]) {
        try {
            ServerSocket ss = new ServerSocket(7777);
            while(true) {
                Socket s = ss.accept(); // espera un cliente
                
                Scanner recibe = new Scanner(s.getInputStream());
                String str = recibe.nextLine();
                
                PrintWriter envia = new PrintWriter(s.getOutputStream());
                envia.printf(str + "\n");
                envia.printf("Se ha conectado un cliente al servidor\r\n");
                envia.flush();
                
                s.close();
            }
        } catch (IOException e) { 
            System.out.println(e);
        }
    }
}
