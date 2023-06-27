/** Clase Punto: define un punto en un espacio bidimensional  
 *  entero, con la funcionalidad que se indica a continuacion.
 *  @author Libro IIP-PRG
 *  @version 2015-2016
 */
 
public class Punto {
    
    private int x; // abscisa del punto
    private int y; // ordenada del punto

    /** crea el punto (0, 0) */
    public Punto() {
        x = 0; 
        y = 0; 
    }

    /** crea el punto (abs, ord) */
    public Punto(int abs, int ord) { 
        x = abs;
        y = ord;
    }

    /** crea el punto (coord, coord) */
    public Punto(int coord) { 
        x = coord; 
        y = coord; 
    }

    /** devuelve la abscisa de un punto */
    public int getX() { return x; }

    /** devuelve la ordenada de un punto */
    public int getY() { return y; }

    /** actualiza a nueva la abscisa de un punto */
    public void setX(int nueva) { x = nueva; }

    /** actualiza a nueva la ordenada de un punto */
    public void setY(int nueva) { y = nueva; }

    /** devuelve la distancia al origen de un punto */
    public double distOrigen() { return Math.sqrt(x * x + y * y); }

    /** actualiza a (abs, ord) las componentes de un punto */
    public void asignar(int abs, int ord) {
        x = abs; 
        y = ord; 
    } 
}
