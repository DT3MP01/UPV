/** PruebaPuntoR: Test sobre variables locales y globales
 *  @author IIP
 *  @version 2016-2017
 */
public class TestLocalGlobal {
    
    private static final double PI = Math.PI;
    
    public static void main(String[] args) {
        System.out.println("constante PI en main: " + PI);
        double argumento = PI;
        System.out.println("argumento en main: " + argumento + "\n");
        
        aCero(argumento);
        System.out.println("argumento en main: " + argumento);
    }
    public static void aCero(double parametro) { 
        System.out.println("argumento en aCero: " + argumento);
        System.out.println("constante PI en aCero: " + PI);
        System.out.println("parametro en aCero: " + parametro);
        
        parametro = 0.0; 
        System.out.println("parametro en aCero: " + parametro + "\n");
    }    
}