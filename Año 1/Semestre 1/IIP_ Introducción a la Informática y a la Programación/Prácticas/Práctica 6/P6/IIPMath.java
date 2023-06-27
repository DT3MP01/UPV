 

/**
 * Clase IIPMath: clase de utilidades que implementa algunas operaciones 
 * matematicas: IIPMath.sqrt(double) y IIPMath.log(double).
 *
 * @author IIP
 * @version Curso 2018-19
 */
public class IIPMath {
    /** Valor aproximado de log(2). */
    public static final double LOG_2 = 0.6931471805599453; 
    
    /** No se pueden crear objetos de esta clase. */
    private IIPMath() { }    
    
    /**
     * Devuelve la raíz cuadrada de x >= 0, con error epsilon > 0. 
     * // COMPLETAR COMENTARIOS 
     */
    public static double sqrt(double x, double epsilon) {
        double res = (1 + x) / 2;
        double dif = res; 
        while (dif > epsilon) {
            double resAnterior = res; 
            res = (res + x / res) / 2;
            dif = resAnterior - res;
            // calculado t1 y dif1
        }
        return res;
    }            

    /**
     * Devuelve la raíz cuadrada de x >= 0, con error 1e-15. 
     * // COMPLETAR COMENTARIOS 
     */
    public static double sqrt(double x) {    
        double res = sqrt(x, 1e-15);
        return res;
    }               
                   
    /**
     * Devuelve log(z), 1/2 <= z < 1, con error epsilon > 0.
     * // COMPLETAR COMENTARIOS
     */
    public static double logBase(double z, double epsilon) {
        double y = (1 - z) / (1 + z); 
        double yAl2 = y * y; 
        double termino = y; 
        double res = termino;
        int k = 1;// calculado u1 double res = termino; // y sumado u1
        while (termino >= epsilon) {
           termino = yAl2 * termino * (2 * k - 1) / (2 * k + 1);
           k++;
           res += termino;
        }
        // PARADA: termino < epsilon
        return -2 * res;
    }
            
    /**
     * Devuelve log(x), x > 0, con error epsilon > 0.
     * // COMPLETAR COMENTARIOS
     */
    public static double log(double x, double epsilon) {      
        if (x == 1) { 
            return 0; 
        }
        // Cálculo de m y x tales que x = 2^m*z y 1/2 <= z < 1 
        int m = 0; 
        double z = x;
        
        while (z >= 1) { 
            z = z / 2; 
            m++;
         } 
        
        while (z < 0.5) { 
            z = z * 2; 
            m--; 
        }
        // Cálculo de log (x)
        return m * LOG_2 + logBase(z, epsilon);
    }

    /**
     * Devuelve log(x), x > 0, con error 1e-15.
     * // COMPLETAR COMENTARIOS
     */
    public static double log(double x) {    
        double res = log(x, 1e-15);
        return res;
    }
}
