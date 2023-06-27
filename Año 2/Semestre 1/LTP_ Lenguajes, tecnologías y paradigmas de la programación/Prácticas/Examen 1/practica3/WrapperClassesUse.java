
/**
 * class WrapperClassesUse.
 * 
 * @author LTP 
 * @version 2018-19
 */

public class WrapperClassesUse {        
    public static void main(String[] args) {            
        // Assignment of wrapper variables to elementary types 
        int i = new Integer(123456);
        byte b = new Byte((byte) 2);
        short s = new Short((short) 33);
        long l = new Long(333333333L);
        float f = new Float(400);
        double d = new Double(200);
        char c = new Character('D');
        boolean bool = new Boolean(false);
        
        // Writing elementary variables
        System.out.println("int i = " + i);
        System.out.println("byte b = " + b);
        System.out.println("short s = " + s);
        System.out.println("long l = " + l);
        System.out.println("float f = " + f);
        System.out.println("double d = " + d);
        System.out.println("char c = " + c);
        System.out.println("boolean b = " + b);
               
        // Assignment of elementary values to wrapper variables
        Integer eI = 123456;
        Byte eB = 2;
        Short eS = 33;
        Long eL = 333333333L;
        Float eF = (float) 400;
        Double eD = (double) 200;
        Character eC = 'D';
        Boolean eBool = false;
            
        // Writing wrapper variables
	System.out.println("\n" + "Integer I = " + eI);
	System.out.println("Byte B = " + eB);
	System.out.println("Short S = " + eS);
	System.out.println("Long L = " + eL);
	System.out.println("Float F = " + eF);
	System.out.println("Double D = " + eD);
	System.out.println("Character C = " + eC);
	System.out.println("Boolean Bool = " + eBool);
    }    
}