/** Clase PuntoR: define un punto en un espacio bidimensional  
 *  Real, con la funcionalidad que se indica a continuacion.
 * 
 * @author IIP
 * @version 2017-2018
 */

public class PuntoR {
    
    // Un PuntoR TIENE...
    private double x; // UNA abscisa
    private double y; // UNA ordenada
    
    /** Crea un punto (abs, ord) */
    public PuntoR(double abs, double ord) {
        x = abs; 
        y = ord;
    }
    
    /** Crea un punto con las mismas coordenadas que otro */
    public PuntoR(PuntoR otro) {
        /*x = otro.x; 
        y = otro.y;*/
        this(otro.x, otro.y);
    }
    
    /** Crea un punto estandar, i.e. el (0.0, 0.0) 
        o punto origen de coordenadas */
    public PuntoR() { 
        /*x = 0.0; 
        y = 0.0;*/
        this(0.0, 0.0);
    }
    
    /** Devuelve la abscisa de un punto */
    public double getX() { return x; } 
    
    /** Devuelve la ordenada de un punto */
    public double getY() { return y; }  
    
   /** Actualiza a nuevo el valor de la abscisa de un punto */
    public void setX(double nuevo) { x = nuevo; }
    
    /** Actualiza a nuevo el valor de la ordenada de un punto */
    public void setY(double nuevo) { y = nuevo; }

    /** Desplaza un punto, incrementando sus coordenadas 
     *  en dx y dy respectivamente */
    public void mover(double dx, double dy) { 
        x += dx; 
        y += dy; 
    }
   
    // Metodo privado que devuelve un valor real aleatorio en
    // el rango [0.0, Math.sqrt(x * x + y * y)]
    private double aleatorio() { return Math.random() * (distOrigen() + 1); }
    
    /** Desplaza un punto aleatoriamente, incrementando 
     *  sus coordenadas en un valor aleatorio */
    public void moverAleat() { 
        x += aleatorio(); 
        y += aleatorio(); 
    }
    
    /** Devuelve la distancia de un punto al origen */
    public double distOrigen() { return Math.sqrt(x * x + y * y); }
    
    /** Devuelve la distancia de un punto a otro */
    public double distancia(PuntoR otro) { 
        double dx = otro.x - x;
        double dy = otro.y - y;
        return Math.sqrt(dx * dx + dy * dy); 
    }
    
    /** Devuelve el punto (en coordenadas rectangulares) 
     *  con coordenadas polares (r, a) */
    public static PuntoR dePolarARectangular(double r, double a) {
        return new PuntoR(r * Math.cos(a), r * Math.sin(a));
    }
    
    /** Devuelve un String que representa un punto en su 
     *  tipico formato matematico, i.e. (abscisa, ordenada) */
    public String toString() { return "(" + x + ", " + y + ")"; } 
    
    /** Comprueba si un punto es igual a otro, 
     *  i.e. si ambos son puntos AND si sus coordenadas coinciden */
    public boolean equals(Object otro) {
        return otro instanceof PuntoR
	           && this.x == ((PuntoR) otro).x
	           && this.y == ((PuntoR) otro).y;
    }
    
}