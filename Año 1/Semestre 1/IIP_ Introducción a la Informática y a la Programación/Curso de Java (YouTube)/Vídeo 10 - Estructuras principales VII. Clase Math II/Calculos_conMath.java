
public class Calculos_conMath {
    public static void main(String[] args) {
        /**
        int raiz = Math.sqrt(9); 
        Esto daría error, ya que la clase Math siempre debe ser double.
        */
       //double raiz = Math.sqrt(9); //Declaración e inicialización de variable
       
       //System.out.println(raiz); Nos imprimaría la raíz cuadrada de 9 = 3
       
       float num1=5.85F;
       int resultado=Math.round(num1);
       /**
        double num1=5.85;
        int resultado=Math.round(num1);
        Esto daría un error ya que la clase Math.round, en este caso,
        obliga a num1 a ser una variable de tipo long y no double.
        
        Si num1 fuese un float, resultado debería ser de tipo int.
        
        REFUNDICIÓN:
        int raiz = (int)Math.round(num1); 
        Se trata de convertir un tipo de archivo, en otro. 
        En este caso, Math.round, que es de tipo long, se convertiría a
        tipo int. Como el resultado es un 6, no habría problema
        en la conversión de long a int, pero si hubiese sido
        8787878787878878788, int no lo hubiese podido almacenar
        y hubiese truncado el número.
        
        double num1=5.85;
        int resultado = (int) Math.round(num1);
        Esto convertiría el formato de Math.round (que es de tipo long), a
        tipo int.
        
        MÉTODO POW
        Estrucutura: Math.pow(double a, double b): double - Math;
        Objetivo: Elevar una base a un exponente. Debe ser doubles y el
        resultado también será double.
        double base = 5;
        double exponente = 3;
        double resultado = Math.pow(base,exponente); o
        int resultado = (double)Math.pow(base,exponente);
        */
       System.out.println(resultado);
    }
}
