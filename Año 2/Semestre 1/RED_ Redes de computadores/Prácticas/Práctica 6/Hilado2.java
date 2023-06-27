import java.lang.Thread;
import java.util.*;
import java.net.*;
import java.io.*;

public class Hilado2 extends Thread {
    Socket s;
    
    public static void main(String[] args) throws IOException {
        ServerSocket ss = new ServerSocket(7777);
        
        while(true) {
            Socket s = ss.accept();
            Hilado2 t = new Hilado2(s);
            t.start();
        }
    }
    
    public Hilado2(Socket so) {
        s = so;
    }
    
    public void run() {
        try {
            Scanner recibe = new Scanner(s.getInputStream());
            String str = "";
                
            PrintWriter envia = new PrintWriter(s.getOutputStream());
            
            while (!str.equals("FIN")) {
                  str = recibe.nextLine();
                  System.out.println(str);
                  envia.println(str + "\n");
                  envia.flush();
            }
            
            s.close();
        } catch (IOException e) {
                System.out.println("Not OK");
        }
    }
}