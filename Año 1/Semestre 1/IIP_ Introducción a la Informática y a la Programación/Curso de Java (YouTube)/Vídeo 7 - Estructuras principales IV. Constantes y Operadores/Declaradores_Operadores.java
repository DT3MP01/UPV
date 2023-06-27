
public class Declaradores_Operadores {
    public static void main(String[] args) {
        //int a; Declaración de variable de tipo entero (int)
        double a;
        a = 5;
        double b;
        b = 7;
        double c;
        c = b+a;
        /**
         int c;
         c = b/a --> esto imprimiría en pantalla el número 1, ya que como
         número int, SOLO ALMACENA el VALOR ENTERO y DESECHA el DECIMAL.
         */
        c++;
        //c+= 6; Esto incrementaría en 6 la variable "c".
        System.out.println(c); 
        /** 
        println = print line;
        imprime un salto de línea
        */
        
    }
}
