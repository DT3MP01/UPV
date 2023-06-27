import java.net.*;
import java.io.*;
import java.util.Scanner;

/**
 * Write a description of class SequencialTCP here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class ServidorTCP2 {
    public static void main(String args[]) {
        try {
            ServerSocket ss = new ServerSocket(8000);
            while(true) {
                Socket s = ss.accept(); // espera un cliente
                
                Scanner recibe = new Scanner(s.getInputStream());
                String str = recibe.nextLine();
                String cad = "";
                
                PrintWriter envia = new PrintWriter(s.getOutputStream());
                //envia.println("<html><body><img src = https://e.rpp-noticias.io/normal/2018/11/22/484448_715070.jpg" + "</img></body></html>");
                while (!str.equals("")) {
                    str = recibe.nextLine();
                    cad += str + "\r\n";
                }
                
                envia.printf("HTTP/1.0 200 OK \r\n");
                envia.printf("Content-Type: text/plain \r\n");
                envia.printf("\r\n");
                envia.println(cad + "\n");
                envia.flush();
                
                s.close();
            }
        } catch (IOException e) { 
            System.out.println(e);
        }
    }
}