
/**
 * Clase: Modelo donde se redactan las características comunes de un grupo
 de objetos.
 
 * Objeto: Ejemplar perteneciente a una clase.
 *  · Tiene propiedades (atributos):
 *  · Color, peso, alto, largo...
 *  · Accediendo a propiedades de objeto desde código (pseudocódigo):
 *  · nombre.propiedad = valor;
 *  · Renault.color = "rojo";
 *  · Renault.peso = 1500;
 *  · Renault.ancho = 2000;
 *  
 *  Tiene un comportamiento (¿Qué es capaz de hacer?):
 *  · Arrancar, frenar, girar, acelerar...
 *  · Accediendo a comportamiento de objeto desde código (pseudocódigo):
 *  · nombre.método();
 *  · Renault.arranca();
 *  · Renault.frena();
 */
    public class Coche {
        int ruedas;
        int largo;
        int ancho;
        int motor;
        int peso;
        
        /**Sintaxis método constructor:
         * public nombre_clase
         */
    public Coche() { //método constructor - establece el estado inicial del coche.
        ruedas = 4;
        largo = 2000;
        ancho = 300;
        motor = 1600;
        peso = 500;
    }
}