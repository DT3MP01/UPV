package examExample;

/**
 * Clase TimeInstant. 
 *<p>
 * Esta clase permite representar instantes o marcas de tiempo
 * (<code>Timestamp</code>) con detalle de horas y minutos. Así,  
 * esta clase representa el momento que define un instante de tiempo,
 * en este caso, las horas y los minutos de un día cualquiera.
 * </p>
 * 
 *  @author IIP. Grado en Informatica. ETSINF, UPV 
 *  @version Curso 2018-19
 */
public class TimeInstant {
    // ATRIBUTOS:
    /** 
     *  Variable entera para almacenar el atributo horas. 
     *  Debe pertenecer al rango <code>[0..23]</code>.
     */
    private int hours;
    /** 
     *  Variable entera para almacenar el atributo minutos. 
     *  Debe pertenecer al rango <code>[0..59]</code>. 
     */
    private int minutes;
    
    // CONSTRUCTORES:
    /**
     *  Crea un <code>TimeInstant</code> con el valor de
     *  las horas y los minutos que recibe como argumentos,
     *  <code>iniHours</code> y <code>iniMinutes</code>, 
     *  respectivamente.
     *  <p> Debe cumplirse la precondición: 
     *  <code>0 <= iniHours < 24, 0 <= iniMinutes < 60</code>. </p>
     */
    public TimeInstant(int iniHours, int iniMinutes) {
        this.hours = iniHours;
        this.minutes = iniMinutes;
    }
    
    /**
     * Crea un <code>TimeInstant</code> con el valor del instante
     * actual UTC (tiempo universal coordinado).
     */
    public TimeInstant() { 
        long tMinTotal = System.currentTimeMillis() / (60 * 1000);
        int tMinCurrent = (int) (tMinTotal % (24 * 60));        
        hours = tMinCurrent / 60;        
        minutes = tMinCurrent % 60; 
    }
   
    // CONSULTORES Y MODIFICADORES:
    /** Devuelve las horas del TimeInstant. */ 
    public int getHours() {
        return this.hours;
    }
    /** Devuelve los minutos del TimeInstant. */
    public int getMinutes() {
        return this.minutes;
    }
    
    /** Actualiza las horas del TimeInstant. */ 
    public void setHours(int hh) {
        this.hours = hh;
    }
   
    /** Actualiza los minutos del TimeInstant. */ 
    public void setMinutes(int mm) {
        this.minutes = mm;
    }
   
    // OTROS MÉTODOS:
    /** Devuelve el TimeInstant en el formato "<code>hh:mm</code>". */
    public String toString() {
        String hh = "0" + this.hours;
        hh = hh.substring(hh.length() - 2);
        String mm = "0" + this.minutes;
        mm = mm.substring(mm.length() - 2);
        return hh + ":" + mm;
    }
   
    /** Decrementa en 1 minuto el TimeInstant. */
    public void decrement1Min() {
        /* COMPLETAR */
    }
}
