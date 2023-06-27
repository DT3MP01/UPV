import java.lang.Thread;
import java.util.*;
import java.net.*;
import java.io.*;

public class Cliente {
    Socket s;
    String msg = "";
    
    public Cliente (String s) {
      msg = s;  
    }
    
    public static void main(String[] args) throws IOException {
        Socket s = new Socket("rdc00.redes.upv.es", 7777);
        String str = "";
        Hilado2 h = new Hilado2(s);
        h.start();
        
        PrintWriter envia = new PrintWriter(s.getOutputStream());
        
        while (!str.equals("EXIT")) {
           Scanner s2 = new Scanner(System.in);
           str = s2.nextLine();
           envia.println(str);
           envia.flush();
        }
        
        s.close();
    }
    
    public void run() {
        try {
            Scanner recibe = new Scanner(s.getInputStream());
            String str = "";
            
            while (recibe.hasNext()) {
                  str = recibe.nextLine();  
                  System.out.println(str);
            }
        } catch (IOException e) {
                System.out.println("Not OK");
        }
    }
}
