
/**
 * Write a description of class isPrefixRecur here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class isPrefixRecur {
    // instance variables - replace the example below with your own
    public static boolean isPrefix(String a, String b) {
        boolean c = false;
        
        if (a == "") {
            c = true;
        }
        
        if (b == "") {
            c = false;
        }
        
        if (a.length() > b.length()) {
            c = false;
        }
        
        if (a.length() == b.length()) {
            c = false;
        }
        
        if (a.charAt(0) != b.charAt(0)) {
            isPrefix(a.substring(a.length() - a.length() + 1), b.substring(b.length() - b.length() + 1));
        } else {
            c = true;
        }
        
        return c;
    }
}
