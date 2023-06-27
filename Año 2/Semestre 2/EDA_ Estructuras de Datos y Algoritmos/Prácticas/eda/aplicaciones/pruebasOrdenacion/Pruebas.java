package aplicaciones.pruebasOrdenacion;

import java.util.Arrays;
/**
 * Write a description of class Pruebas here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class Pruebas {
    public static void main(String[] args) {
        TestOrdenacion to = new TestOrdenacion();
        Integer[] e = {0, 3, 4, 8};
        System.out.println(to.maximo(e, 0, 3));
    }
}
