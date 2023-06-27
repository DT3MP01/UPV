package pract5;

 

import static org.junit.Assert.*;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/**
 * The test class TestPractica5PRG.
 *
 * @author  Adrian Palacios
 * @version 1.0
 */
public class TestPractica5PRG
{
    /**
     * Default constructor for test class TestPractica5PRG
     */
    public TestPractica5PRG()
    {
    }

    /**
     * Sets up the test fixture.
     *
     * Called before every test case method.
     */
    @Before
    public void setUp()
    {
    }

    /**
     * Tears down the test fixture.
     *
     * Called after every test case method.
     */
    @After
    public void tearDown()
    {
    }
    
    @Test
    public void test_size() {
        SetString conjunto = new SetString();
        int size;
        
        size = conjunto.size();
        assertEquals(0,size);
        
        conjunto.add("i");
        size = conjunto.size();
        assertEquals(1,size);
            
        conjunto.add("a");
        size = conjunto.size();
        assertEquals(2,size);
            
        conjunto.add("u");
        size = conjunto.size();
        assertEquals(3,size);
            
        conjunto.add("e");
        size = conjunto.size();
        assertEquals(4,size);
            
        conjunto.add("o");
        size = conjunto.size();
        assertEquals(5,size);

        conjunto.add("u");
        size = conjunto.size();
        assertEquals(5,size);
    }
    
    @Test
    public void test_add() {
        SetString conjunto = new SetString();
        String res;
        
        conjunto.add("i");
        res = conjunto.toString();
        assertEquals("i\n",res);
            
        conjunto.add("a");
        res = conjunto.toString();
        assertEquals("a\ni\n",res);
            
        conjunto.add("u");
        res = conjunto.toString();
        assertEquals("a\ni\nu\n",res);
            
        conjunto.add("e");
        res = conjunto.toString();
        assertEquals("a\ne\ni\nu\n",res);
            
        conjunto.add("o");
        res = conjunto.toString();
        assertEquals("a\ne\ni\no\nu\n",res);

        conjunto.add("u");
        res = conjunto.toString();
        assertEquals("a\ne\ni\no\nu\n",res);
    }
    
    @Test
    public void test_contains() {
        SetString conjunto = new SetString();
        boolean res;
        
        res = conjunto.contains("u");
        assertEquals(false,res);
        
        conjunto.add("a");
        conjunto.add("e");
        conjunto.add("i");
        
        res = conjunto.contains("a");
        assertEquals(true,res);
        res = conjunto.contains("e");
        assertEquals(true,res);
        res = conjunto.contains("i");
        assertEquals(true,res);
        res = conjunto.contains("o");
        assertEquals(false,res);
    }
    
    @Test
    public void test_remove() {
        SetString conjunto = new SetString();
        String res;
        
        conjunto.remove("u");
        res = conjunto.toString();
        assertEquals("",res);
        
        conjunto.add("i");
        conjunto.add("a");
        conjunto.add("u");
        conjunto.add("e");
        conjunto.add("o");
        
        res = conjunto.toString();
        assertEquals("a\ne\ni\no\nu\n",res);
        
        conjunto.remove("z");
        res = conjunto.toString();
        assertEquals("a\ne\ni\no\nu\n",res);
        
        conjunto.remove("o");
        res = conjunto.toString();
        assertEquals("a\ne\ni\nu\n",res);
        
        conjunto.remove("e");
        res = conjunto.toString();
        assertEquals("a\ni\nu\n",res);
            
        conjunto.remove("u");
        res = conjunto.toString();
        assertEquals("a\ni\n",res);
            
        conjunto.remove("a");
        res = conjunto.toString();
        assertEquals("i\n",res);
            
        conjunto.remove("i");
        res = conjunto.toString();
        assertEquals("",res);

        conjunto.remove("i");
        res = conjunto.toString();
        assertEquals("",res);    
    }
    
    @Test
    public void test_intersection() {
        SetString c1 = new SetString();
        SetString c2 = new SetString();
        SetString cres;
        String res;
        
        c1.add("a");
        c1.add("c");
        c1.add("e");
        
        cres = c1.intersection(c2);
        res = cres.toString();
        assertEquals("",res);
        
        c2.add("o");
        c2.add("p");
        c2.add("q");
        
        cres = c2.intersection(c1);
        res = cres.toString();
        assertEquals("",res);
        
        c1.add("d");
        c1.add("f");
        c1.add("o");
        c2.add("d");
        c2.add("f");
        
        cres = c1.intersection(c2);
        res = cres.toString();
        assertEquals("d\nf\no\n",res);
        
        cres = c1.intersection(c1);
        res = cres.toString();
        assertEquals("a\nc\nd\ne\nf\no\n",res);       
    }
    
        @Test
    public void test_union() {
        SetString c1 = new SetString();
        SetString c2 = new SetString();
        SetString cres;
        String res;
        
        c1.add("a");
        c1.add("c");
        c1.add("e");
        
        cres = c1.union(c2);
        res = cres.toString();
        assertEquals("a\nc\ne\n",res);
        
        c2.add("o");
        c2.add("p");
        c2.add("q");
        
        cres = c2.union(c1);
        res = cres.toString();
        assertEquals("a\nc\ne\no\np\nq\n",res);
        
        c1.add("d");
        c1.add("f");
        c1.add("o");
        c2.add("d");
        c2.add("f");
        
        cres = c1.union(c2);
        res = cres.toString();
        assertEquals("a\nc\nd\ne\nf\no\np\nq\n",res);
        
        cres = c1.union(c1);
        res = cres.toString();
        assertEquals(c1.toString(),res);       
    }
}
