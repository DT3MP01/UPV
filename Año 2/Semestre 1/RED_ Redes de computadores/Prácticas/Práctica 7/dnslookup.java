import java.io.*;
import java.net.*;
import java.util.*;

public class dnslookup {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String host = sc.nextLine();
        
        try {
            InetAddress ipServer = InetAddress.getByName(host);
            System.out.println(ipServer);
        } catch (UnknownHostException e) {
            System.err.println("Hola, me llamo Josep y he salido a la luz");
        }
    }
}
