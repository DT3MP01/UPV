
public class Declaradores_Operadores {
    public static void main(String[] args) {
        final int c; /** Al introducir final y convertirlo en constante,
        el valor de c no podrá ser modificado.
        */
        c = 5;
        final double a_pulgadas;
        a_pulgadas = 2.54;
        double cm = 6;
        double resultado = cm/a_pulgadas;
        /** c = 7; Si introducimos esto, saldría el valor 7 en pantalla si
         no estuviese final.
         */
        
        System.out.println("En " + cm + "cm hay " + resultado + " pulgadas"); 
        /** 
        println = print line;
        imprime un salto de línea
        */
       
       //Se pueden declarar varias variables a la vez
       
       int operador1, operador2, resultado2;
       operador1 = 8;
       operador2 = 7;
       resultado2 = operador1 + operador2;
    }
}
