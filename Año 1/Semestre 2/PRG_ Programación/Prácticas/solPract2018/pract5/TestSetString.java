package pract5;
import static org.junit.Assert.assertEquals;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import java.lang.reflect.Method;
import java.lang.reflect.Field;
//import java.lang.reflect.NoSuchFieldException;

/**
 * The test class TestPractica5PRG.
 *
 * @author  Profes prg
 * @version 2017/2018
 */
public class TestSetString {

    private String[] casos = {
        " empty set. ", 
        " first of the sequence. ",
        " last of the sequence. ", 
        " the middle of the sequence. ", 
        " an element that already belongs to the set",
        " belongs to the set.",
        " does not belongs to the set. ",
        " Error, you are not considering that the list "
            + "is sorted in ascending order.\n"
            + "Probably, you are using equals instead of compareTo",
        " An element that does not belongs to the set",
        " the one and only element in the set"
    };

    private Field firstPub, sizePub;

    /**
     * Default constructor for test class TestPractica5PRG
     */
    public TestSetString() { 
        try { 
            firstPub = SetString.class.getDeclaredField("first");
            firstPub.setAccessible(true);
            sizePub = SetString.class.getDeclaredField("size");
            sizePub.setAccessible(true);
        } catch (NoSuchFieldException e) { ; }
    }

    /**
     * Sets up the test fixture.
     *
     * Called before every test case method.
     */
    @Before
    public void setUp() { }

    /**
     * Tears down the test fixture.
     *
     * Called after every test case method.
     */
    @After
    public void tearDown() { }

    @Test
    public void testSize() {
        SetString setS = new SetString();
        int size;  
        size = setS.size();      assertEquals(0, size);
        String a = "aeiou";
        try {
            NodeString last = null;
            firstPub.set(setS, new NodeString("a"));
            sizePub.set(setS, 1);
            last = (NodeString) firstPub.get(setS);

            size = setS.size();      assertEquals(1, size);
            for (int i = 1; i < a.length(); i++) {
                last.next = new NodeString(a.substring(i, i + 1));
                last = last.next;
                sizePub.set(setS, i + 1);
                size = setS.size();  assertEquals(i + 1, size);
            } 
        } catch (IllegalAccessException e) { ; }

    }

    @Test
    public void testAdd() {
        SetString corr = fromStringToSet("");
        SetString setS = new SetString();
        // datos a introducir
        String[] aux1 = {"", "a", "i", "a", "u", "e", "u", "a", "i"};
        // conjuntos correctos
        String[] ok = {"", "aeai", "i", "ai", "aiu", "aeiu", 
            "aeiu", "aeiu", "aeiu"};
        // tamaños correctos

        // mensajes asociados a cada caso
        int[] msg = {0,  7,  1,   2,   3,   4,   4,   4,   4};

        // primer caso, conjunto vacio
        int size = setS.size();  
        assertEquals("wrong size at an " + ok[0], 0, size);        
        assertEquals("Error" + casos[msg[0]], true, iguales(setS, corr));

        // Segundo caso, equals en lugar de compareTo
        setS =  fromStringToSet("eai");
        setS.add(aux1[1]);
        corr = fromStringToSet(ok[1]);  
        assertEquals("Error" + casos[msg[1]], true, iguales(setS, corr));
        setS = new SetString();

        String s1 = "Wrong size adding";
        String s2 = "Error adding";
        String s3 = "";
        for (int i = 2; i < aux1.length; i++) {
            setS.add(aux1[i]);  
            size = setS.size();
            corr = fromStringToSet(ok[i]); 
            s3 = showSets(setS, corr);
            assertEquals(s1 + casos[msg[i]] + s3 , ok[i].length(), size);     
            assertEquals(s2 + casos[msg[i]] + s3 , true, iguales(setS, corr));
        }        
    }

    @Test
    public void testContains() {
        SetString setS = new SetString();
        boolean res;        
        res = setS.contains("u");  
        assertEquals("u does not belong to" + casos[0], false, res);     
        setS = fromStringToSet("eioa");  
        // datos a introducir
        String[] aux1 =     {"a", "b",   "f",   "u",   "e",  "i",  "o"};
        // respuestas correctas
        boolean[] ok = {false, false, false, false, true, true, true};
        // mensajes asociados a cada caso
        int[] msg =         {7,   6,     6,     6,     5,    5,    5};

        res = setS.contains(aux1[0]);
        assertEquals(casos[msg[0]], ok[0], res);

        for (int i = 1; i < aux1.length; i++) {
            res = setS.contains(aux1[i]);
            assertEquals(aux1[i] + casos[msg[i]], ok[i], res);
        }        
    }

    @Test
    public void testRemove() {
        SetString corr = fromStringToSet("");
        SetString setS = new SetString();
        // datos a introducir
        String[] aux2 = {"",  "aeu", "aei", "ei", "eiu", "eio", "u", "eai"};
        String[] aux1 = {"u", "z",   "a",   "a",  "u",   "i",   "u", "a"  };
        // conjuntos correctos
        String[] ok =   {"",  "aeu", "ei",  "ei", "ei",  "eo",  "",  "eai"};
        // mensajes asociados a cada caso
        int[] msg =    {0,  8,   1,   8,   2,   3,   9,  7};

        // EL ULTIMO CASO ESTA MAL A PROPÓSITO

        String s1 = "Wrong size removing";
        String s2 = "Error removing";
        String s3 = " anything at";

        corr = fromStringToSet(ok[0]); 
        setS = fromStringToSet(aux2[0]); 
        setS.remove(aux1[0]);

        int size = setS.size();
        assertEquals(s1 + s3 + casos[msg[0]], ok[0].length(), size);     
        assertEquals(s2 + s3 + casos[msg[0]], true, iguales(setS, corr));

        int i = 1;
        for (; i < aux1.length - 1; i++) {
            corr = fromStringToSet(ok[i]); 
            setS = fromStringToSet(aux2[i]); 
            setS.remove(aux1[i]);
            s3 = showSets(setS, corr);
            size = setS.size();
            assertEquals(s1 + casos[msg[i]] + s3, ok[i].length(), size);     
            assertEquals(s2 + casos[msg[i]] + s3, true, iguales(setS, corr));
        }          
        //s1 = "Error, you are using equals instead of compareTo";
        corr = fromStringToSet(ok[i]); 
        setS = fromStringToSet(aux2[i]); 
        setS.remove(aux1[i]);
        size = setS.size();    
        assertEquals(casos[msg[i]], true, iguales(setS, corr));
    }

    @Test
    public void testIntersection() {
        SetString c1 = new SetString();
        SetString c2 = new SetString();
        SetString corr, res;
        int size;

        String[] c1S = {"", "ace", "",    "ace", "acdefoq", "acdefoq", "dfopq"};
        String[] c2S = {"", "",  "ace", "opq", "dfopq",   "acdefoq", "acdefoq"};
        // interseccion correcta
        String[] ok =  {"", "",    "",    "",    "dfoq",    "acdefoq", "dfoq"};

        String s, sS1, sS2, sS3;
        for (int i = 0; i < c1S.length; i++) {
            res = new SetString();
            c1 = fromStringToSet(c1S[i]); 
            c2 = fromStringToSet(c2S[i]); 
            corr = fromStringToSet(ok[i]); 
            res = c1.intersection(c2);
            size = res.size();          

            sS1 = toStringSet(c1);
            sS2 = toStringSet(c2);
            sS3 = showSets(res, corr);
            s = "\n" + sS1 + " joined with " + sS2 + " is: " + sS3;  

            assertEquals("Wrong size, " + s, ok[i].length(), size);     
            assertEquals("Error, " + s, true, iguales(res, corr));
        }     

    }

    @Test
    public void testUnion() {
        SetString c1 = new SetString();
        SetString c2 = new SetString();
        SetString corr, res;
        int size;

        String[] c1S = {"", "ac", "",   "ace",    "bcd",   "ace",   "ace" };
        String[] c2S = {"", "",   "ac", "bdf",    "ace",   "bcd",   "ade"};
        // interseccion correcta
        String[] ok =  {"", "ac", "ac", "abcdef", "abcde", "abcde", "acde"};

        String s, sS1, sS2, sS3;
        for (int i = 0; i < c1S.length; i++) {
            res = new SetString();
            c1 = fromStringToSet(c1S[i]); 
            c2 = fromStringToSet(c2S[i]); 
            corr = fromStringToSet(ok[i]);
            res = c1.union(c2);
            size = res.size();

            sS1 = toStringSet(c1);
            sS2 = toStringSet(c2);
            sS3 = showSets(res, corr);
            s = "\n" + sS1 + " joined with " + sS2 + " is: " + sS3;  

            assertEquals("Wrong size, " + s, ok[i].length(), size);     
            assertEquals("Error, " + s, true, iguales(res, corr));
        }     
    }

//     @Test
//     public void testDifference() {
//         SetString c1 = new SetString();
//         SetString c2 = new SetString();
//         SetString corr, res;
//         int size;
//         
//         String[] c1S = {"", "ac", "",   "ace",    "bcd",   "ace", "ace" };
//         String[] c2S = {"", "",   "ac", "bdf",    "ace",   "bcd", "ade"};
//         // interseccion correcta
//         String[] ok =  {"", "ac", "ac", "abcdef", "abde", "abde", "cd"};
//         
//         String s1 = "";
//         for (int i = 0; i < c1S.length; i++) {
//             res = new SetString();
//             c1 = fromStringToSet(c1S[i]); 
//             c2 = fromStringToSet(c2S[i]); 
//             corr = fromStringToSet(ok[i]); 
//             s1 = "the difference beween \"" + c1S[i] + "\" and \"" + c2S[i] 
//                 + "\" is \"" + ok[i] + "\". ";  
//             res = c1.difference(c2);
//             size = res.size();
//             assertEquals("Wrong size, " + s1, ok[i].length(), size);     
//             assertEquals("Error, " + s1, true, iguales(res, corr));
//         }     
//     }

    private SetString fromStringToSet(String a) {
        SetString res = new SetString();
        try {  
            NodeString last = null;
            if (a.length() != 0) {
                firstPub.set(res, new NodeString(a.substring(0, 1)));
                sizePub.set(res, 1);
                last = (NodeString) firstPub.get(res);
            } 
            for (int i = 1; i < a.length(); i++) {
                last.next = new NodeString(a.substring(i, i + 1));
                last = last.next;
                sizePub.set(res, i + 1);
            } 
        } catch (IllegalAccessException e) { ; }
        return res;
    }

    private boolean iguales(SetString a, SetString b) {
        boolean res = false;
        try {
            NodeString aAux = (NodeString) firstPub.get(a);
            NodeString bAux = (NodeString) firstPub.get(b);
            int aSize = (int) sizePub.get(a);
            int bSize = (int) sizePub.get(b);
            if (aSize == bSize) {
                res = true;
                for (int i = 0; i < aSize && res; i++) {
                    res = aAux.data.equals(bAux.data);
                    aAux = aAux.next;
                    bAux = bAux.next;
                }
            }            
        } catch (IllegalAccessException e) { ; }
        return res;
    }

    private boolean igualesHasta(int t, SetString a, SetString b) {
        boolean res = false;
        try {
            NodeString aAux = (NodeString) firstPub.get(a);
            NodeString bAux = (NodeString) firstPub.get(b);
            int aSize = (int) sizePub.get(a);
            int bSize = (int) sizePub.get(b);
            if (aSize == t) {
                res = true;
                for (int i = 0; i < aSize && res; i++) {
                    res = aAux.data.equals(bAux.data);
                    aAux = aAux.next;
                    bAux = bAux.next;
                }
            }            
        } catch (IllegalAccessException e) { ; }
        return res;
    }

    private String showSets(SetString f, SetString e) {        
        NodeString aux;
        String res = "\nSet expected:  "  + toStringSet(e) 
            + "\nSet found:       " + toStringSet(f) + "\n";     
        return res;
    }

    private String toStringSet(SetString s) {
        NodeString aux;
        String res = "{";
        try {
            aux = (NodeString) firstPub.get(s); 
            while (aux != null) {
                res += "\"" + aux.data + "\""; 
                if (aux.next != null) { res += ", "; }            
                aux = aux.next;
            }
        } catch (IllegalAccessException ex) { ; }
        res +=     "}";
        return res;
    }

}