package librerias.util;

import java.util.Arrays;

/**
 * Write a description of class PruebasOrdenacion here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class PruebasOrdenacion {
    public static void main(String[] args) {
        Integer[] v1 = {10, 3, 50, 11, 3, 1, 3, 4, 5, 1};
        
        Ordenacion ord = new Ordenacion();
        
        // ord.mergeSort2(v1);
        
        Integer[] v2 = {86, 66, 24, 78, 100, 106, 46, 53, 89, 69, 5};
        
        ord.quickSort(v2);
    }
}
