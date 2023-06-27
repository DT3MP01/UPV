/**
 * Write a description of class Hilos here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
import java.lang.Thread;

public class Hilo extends Thread {
    String msg = "";
    
    public Hilo(String s) {
        msg = s;
    }
    
    public static void main(String[] args) {
        for (int i = 0; i < 3; i++) {
            String str = "Hola " + i;
            Hilo h = new Hilo(str);
            h.start();
        }
    }
    
    public void run() {
            for (int i = 0; i < 10; i++) {
                System.out.println(msg + " " + i);
                try {
                    sleep(1000);
                } catch (InterruptedException e) {
                    System.out.println("Se mamo");
                }
            }
    }
}
