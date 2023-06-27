/**
 * Clase Comida: representa una comida mediante las calorias que aporta
 * y el tiempo de preparacion que requiere (en minutos). Entre otros, 
 * proporciona un metodo que permite determinar si una comida es mas 
 * sana que otra
 * 
 * @author IIP 
 * @version Curso 2015/16
 */
public class Comida {
    
    private double calorias; // Una Comida TIENE UN numero de calorias 
    private int minutsPrep;  // Una Comida TIENE UNOS minutos de preparacion

    /** crea una comida que aporta c calorias y
     *  requiere de m minutos de preparacion */
    public Comida(double c, int m) {
        calorias = c; 
        minutsPrep = m;
    }

    /** devuelve las calorias que aporta una comida */
    public double getCalorias() { return calorias; }
    
    /** devuelve los minutos de preparacion que requiere una comida */
    public int getminutosPreparacion() { return minutsPrep; }
    
    /** actualiza a nuevas las calorias que aporta una comida */
    public void setCalorias(double nuevas) { calorias = nuevas; }
    
    /** actualiza a nuevos los minutos de preparacion que requiere una comida */
    public void setminutosPreparacion(int nuevos) { minutsPrep = nuevos; }
    
    /** devuelve un String que representa una comida en un formato dado */
    public String toString() {
        return "Comida con  " + calorias + " cal. y " 
               + minutsPrep + " minutos de preparacion";
    }
    
    /** devuelve un entero (int) que indica si una comida es mas sana que otra: 
     *  (a) devuelve un negativo si una comida aporta menos calorias que otra;
     *  (b) devuelve un positivo si una comida aporta  mas  calorias que otra 
     *  (c) si una y otra comidas aportan las mismas calorias, devuelve...
     *    (c.1) 0 si una y otra comidas se preparan en igual numero de minutos
     *    (c.2) un negativo si una comida se prepara en menos minutos que otra 
     *    (c.3) un positivo si una comida se prepara en mas minutos que otra */ 
    public int compareTo(Comida otra) {       
        // Primera version correcta/aceptable, i.e. con un if eficiente:
        // Hipotesis: una y otra tienen las mismas calorias; se elige esta 
        // hipotesis porque minutsPrep es de tipo int y, por tanto, el 
        // resultado se calcula SIN necesidad de hacer ninguna comparacion
        // int res = minutsPrep - otra.minutsPrep; 
        // if (calorias < otra.calorias) { res = -1; }
        // else if (calorias > otra.calorias) { res = 1; }
        // return res;
        
        // Segunda version, mas recomendable: dado que calorias es de tipo   
        // double, se usa el metodo signum de Math para saber el signo de   
        // la diferencia de calorias de una y otra comida. Asi, solo con 
        // un if, si tienen las mismas calorias, se sabe el resultado: 
        int res = (int) Math.signum(calorias - otra.calorias);
        if (res == 0) { res = minutsPrep - otra.minutsPrep; }
        return res;
    }
}
