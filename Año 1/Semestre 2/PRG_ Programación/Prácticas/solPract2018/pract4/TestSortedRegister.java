package pract4;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.time.Year;
import java.util.InputMismatchException;
import java.util.Scanner;
/**
 * Clase TestSortedRegister. Test de la clase SortedRegister.
 * 
 * @author (PRG) 
 * @version (2017/18)
 */
public class TestSortedRegister {

    public static void main(String[] args) throws FileNotFoundException {
        Scanner keyB = new Scanner(System.in);
        String msg = "Año de los datos (hasta 10 años atrás): ";
        int currentY = Year.now().getValue();
        int year = CorrectReading.nextInt(keyB, msg, 
                                          currentY - 10, currentY);   
        Scanner in = null;
        PrintWriter out = null, err = null;
        System.out.print("Nombre del fichero a ordenar: "); 
        String nameIn = keyB.next();
        File f = new File(nameIn);
        in = new Scanner(f);
        f = new File("result.out");
        out = new PrintWriter(f);
        testUnreportedSort(year, in, out);   
        in.close();
        out.close();
    }
  
    /** Metodo de prueba de add(Scanner) y save(PrintWriter) de 
     *  SortedRegister. */
    public static void testUnreportedSort(int year, Scanner in, 
                                          PrintWriter out) {
        SortedRegister c = new SortedRegister(year);
        c.add(in); 
        c.save(out);
    }
}