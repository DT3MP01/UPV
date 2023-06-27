
public class Circulo {

    private double radio; 
    private String color; 
    private int centroX, centroY;
    
    /** crea un circulo estandar, i.e. de radio 50.0, 
     *  color negro y centro en (100, 100) */
    public Circulo() {
        radio = 50.0; 
        color = "negro"; 
        centroX = 100;  centroY = 100;
    }
    
    /** crea un circulo de radio r, color c y centro en (px, py) */
    public Circulo(double r, String c, int px, int py)  {
        radio = r;  
        color = c; 
        centroX = px; centroY = py; 
    }

    /** devuelve el radio de un circulo */
    public double getRadio() { return radio; }    

    /**  devuelve el color de un circulo */
    public String getColor() { return color; }  

    /**  devuelve la abscisa del centro de un circulo */
    public int getCentroX() { return centroX; }  

    /** devuelve la ordenada del centro de un circulo */
    public int getCentroY() { return centroY; }
 
    /** actualiza  a nuevo el radio de un circulo */
    public void setRadio(double nuevo) { radio = nuevo; }   

    /** actualiza  a nuevo el color de un circulo */
    public void setColor(String nuevo) { color = nuevo; }   
 
    /** actualiza a (px, py) el centro  de un circulo */
    public void setCentro(int px, int py) { 
        centroX = px; centroY = py; 
    }
   
    /**  devuelve el area de un circulo */
    public double area() { return 3.14 * radio * radio; }
    
    /** devuelve el perimetro de un circulo */
    public double perimetro() { return 2 * 3.14 * radio; }
    
    /** desplaza 10 unidades a la derecha un circulo */
    public void aLaDerecha() { centroX += 10; }
    
    /** aumenta en un factor de 1.3 el radio de un circulo */
    public void crece() { radio = radio * 1.3; }
    
    /** reduce en un factor de 1.3 el radio un circulo */
    public void decrece() { radio = radio / 1.3; }   
    
    /** devuelve un String con las componentes de un circulo */
    public String toString() {
        String res = "Circulo de radio " + radio;
        res += ", color " + color + " y centro (" + centroX + ", " 
               + centroY + ")";
        return res;
    }
}