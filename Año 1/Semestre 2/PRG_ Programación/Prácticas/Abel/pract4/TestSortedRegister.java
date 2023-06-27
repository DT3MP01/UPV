package pract4;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.time.Year;
import java.util.InputMismatchException;
import java.util.Scanner;
import pract4.utilPRG.CorrectReading;
/**
 * Clase TestSortedRegister. Test de la clase SortedRegister.
 * 
 * @author (PRG. ETSINF - UPV)
 * @version (2018/19)
 */
public class TestSortedRegister {
    /** No hay objetos de esta clase. */ 
    private TestSortedRegister() { }

    public static void main(String[] args) throws FileNotFoundException {
        Scanner keyB = new Scanner(System.in);
        String msg = "Año de los datos (hasta 10 años atrás): ";
        int currentY = Year.now().getValue();
        int year = CorrectReading.nextInt(keyB, msg, currentY - 10, currentY);   
        Scanner in = null;
        PrintWriter out = null, err = null;
        System.out.print("Nombre del fichero a ordenar: "); 
        String nameIn = keyB.next();
        File f = new File("pract4/data/" + nameIn);
        in = new Scanner(f);
        f = new File("pract4/data/" + "result.out");
        out = new PrintWriter(f);
        testUnreportedSort(year, in, out); 
    System.out.println("Fichero " + nameIn + " procesado.");
        in.close();
        out.close();
    }
  
    /** Metodo de prueba de add(Scanner) y save(PrintWriter) de SortedRegister. */
    public static void testUnreportedSort(int year, Scanner in, PrintWriter out) {
        SortedRegister c = new SortedRegister(year);
        try{
            c.add(in); 
        }catch(IllegalArgumentException e){
            out.println(e.getMessage());
        }catch(ArrayIndexOutOfBoundsException a){
            out.println(a.getMessage());
        }
        c.save(out);
        System.out.println("testUnreportedSort finalizado");
    }
}