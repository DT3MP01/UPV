
/**
 * Write a description of class isPrefix here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class isPrefix
{
   public static boolean isPrefix(String a, String b) {
       boolean c = false;
       
       /* if (a == "") {
           c = true;
       }
       
       if (b == "") {
           c = true;
       }*/
       
       if (b.startsWith(a)) {
           c = true;
       } else {
           c = false;
       }
       
       return c;
   }
}
