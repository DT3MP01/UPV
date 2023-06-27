/** Clase PuntoR: define un punto en un espacio bidimensional  
 *  Real, con la funcionalidad que se indica a continuacion.
 *  @author Libro IIP-PRG
 *  @version 2015-2016
 */

public class PuntoR {

    private double abs; // abscisa del punto
    private double ord; // ordenada del punto
   
    /** crea un punto (0.0, 0.0) */
    public PuntoR() { 
        abs = 0.0; 
        ord = 0.0; 
    }

    /** crea un  punto (abs, ord) */
    public PuntoR(double x, double y) { 
        abs = x;  
        ord = y; 
    }

    /** crea un punto (coord, coord) */
    public PuntoR(double coord) { 
        abs = coord; 
        ord = coord; 
    }

    /** devuelve la abscisa de un punto */
    public double getAbs() { return abs; }

    /** devuelve la ordenada de un punto */
    public double getOrd() { return ord; }

    /** actualiza a nueva la abscisa de un punto */
    public void setX(double nueva) { abs = nueva; }

    /** actualiza a nueva la ordenada de un punto */
    public void setY(double nueva) { ord = nueva; }

    /** devuelve la distancia al origen de un punto */
    public double distOrigen() { return Math.sqrt(abs * abs + ord * ord); }

    /** actualiza a (x, y) las componentes de un punto */
    public void asignar(double x, double y) { 
        abs = x; 
        ord = y; 
    }
   
    /** comprueba si un Punto es igual a otro o, i.e. si sus
     *  abscisas coinciden y sus ordenadas coinciden */
    /*public boolean equals(Object o) {
        return o instanceof PuntoR 
               && abs == ((PuntoR) o).abs 
               && ord == ((PuntoR) o).ord; 
    }*/
}
