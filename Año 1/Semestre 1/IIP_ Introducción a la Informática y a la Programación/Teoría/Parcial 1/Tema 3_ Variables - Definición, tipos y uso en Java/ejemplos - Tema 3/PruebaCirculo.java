/**
 * Clase PruebaCirculo: Programa de prueba de la clase Circulo 
 * @author Libro IIP-PRG
 * @version 2015-2016
 */

public class PruebaCirculo {
    public static void main(String[] args) {
        // crear un circulo de radio 50.0, color amarillo 
        // y con centro en (100, 100)
        double radio = 30.0; 
        int centroX = 50; 
        int centroY = 50;
        String color = new String("amarillo"); 
        Circulo c1 = new Circulo(radio, color, centroX, centroY);
        
        // duplicar el radio de c1
        c1.setRadio(2 * c1.getRadio());
        
        // crear un circulo estandar, i.e. de radio 50.0, 
        // color negro y centro en (100, 100) 
        Circulo c2 = new Circulo();
        
        // mostrar por pantalla c2, el circulo estandar 
        System.out.println(c2.toString());
    }
}
