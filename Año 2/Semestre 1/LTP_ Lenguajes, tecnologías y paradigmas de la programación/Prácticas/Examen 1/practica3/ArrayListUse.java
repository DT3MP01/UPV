import java.util.*;
import java.io.*;

/**
 * class ArrayListUse.
 * 
 * @author LTP
 * @version 2018-19
 */

public class ArrayListUse {       
    public static void main(String[] args) {        
        if (args.length != 1) {
            System.err.print("You must specify an argument: filename");
            System.exit(0);
        }
        
        // Creating File object, Scanner object, ArrayList object
        File fd = new File(args[0]);
        System.out.println(fd.getAbsolutePath());
        Scanner file = null;
        ArrayList<String> list = new ArrayList<String>();
        
        try {
            file = new Scanner(fd);
        } catch (FileNotFoundException e) {
            System.err.println("File does not exists " + e.getMessage());
            System.exit(0);
        }
                
        // Reading file, adding lines to the list
        
        while (file.hasNext() != false) {
            String s = file.nextLine();
            list.add(s);
        }
        
        // Sorting the list, writing it to console
        Collections.sort(list);
        file.close();
        System.out.println(list);
        list.toString();
        // TO COMPLETE ...
    }     
}