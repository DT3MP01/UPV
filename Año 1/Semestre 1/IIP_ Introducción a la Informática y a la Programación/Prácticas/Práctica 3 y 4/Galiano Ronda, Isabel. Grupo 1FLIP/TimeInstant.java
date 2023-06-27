package pract4;

/**
 * <p>
 * Esta clase permite representar instantes o marcas de tiempo
 * (<code>Timestamp</code>) con detalle de minutos. Asi, esta 
 * clase representa el momento o instante que define una hora,
 * en este caso, las horas y los minutos de la misma.
 * </p>
 * 
 *  @author IIP. Grado en Informatica. ETSINF, UPV 
 *  @version Curso 2018-19
 */
public class TimeInstant {

    // ATRIBUTOS:
    /** Variable entera para almacenar el atributo horas. 
     *  Debe pertenecer al rango <code>[0, 23]</code>. */
    private int hours;
    /** Variable entera para almacenar el atributo minutos. 
     *  Debe pertenecer al rango <code>[0, 59]</code>. */
    private int minutes;

    // CONSTRUCTORES:
    /**
     *  Crea un <code>TimeInstant</code> con el valor de
     *  las horas y los minutos que recibe como argumentos,
     *  <code>h</code> y <code>m</code> respectivamente.
     *
     *  <p> Debe cumplirse la precondicion: 
     *  <code>0 <= h < 24, 0 <= m < 60</code>. </p>
     */
    public TimeInstant(int h, int m) {
        hours = h;
        minutes = m;
    }
   
    /**
     * Crea un <code>TimeInstant</code> con el valor del instante
     * actual UTC (tiempo universal coordinado).
     */
    public TimeInstant() { 
        int msRestan =  (int) (System.currentTimeMillis() % (24 * 60 * 60 * 1000));
        hours   = msRestan / (60 * 60 * 1000);
        msRestan = msRestan % (60 * 60 * 1000);
        minutes = msRestan / (60 * 1000); 
    }
    
    // CONSULTORES Y MODIFICADORES:
    /** Devuelve las horas del TimeInstant. */
    public int getHours() { return hours; }

    /** Devuelve los minutos del TimeInstant. */
    public int getMinutes() { return minutes; }
   
    /** Actualiza las hours del TimeInstant. */ 
    public void setHours(int nuevas) { hours = nuevas; }
   
    /** Actualiza los minutes del TimeInstant. */ 
    public void setMinutes(int nuevos) { minutes = nuevos; }
   
    // OTROS METODOS:
    /** Devuelve el TimeInstant en el formato "<code>hh:mm</code>". */
    public String toString() {
        String hh = "0" + hours;
        hh = hh.substring(hh.length() - 2);
        String mm = "0" + minutes;
        mm = mm.substring(mm.length() - 2);
        return hh + ":" + mm;
    }
   
    /** Devuelve <code>true</code> sii <code>otro</code> es 
     *  un objeto de la clase <code>TimeInstant</code>
     *  y sus horas y minutos coinciden con los del objeto 
     *  en curso. 
     */
    public boolean equals(Object otro) {
        return otro instanceof TimeInstant
               && this.hours   == ((TimeInstant) otro).hours
               && this.minutes == ((TimeInstant) otro).minutes;
    }  
      
    /** Devuelve el numero de minutos transcurridos desde las 00:00 
     *  hasta el instante representado por el objeto en curso.
     */
    public int toMinutes() { return minutes + hours * 60; }
    
    /** Compara cronologicamente el instante del objeto en curso
     *  con el del objeto de la clase <code>TimeInstant</code> 
     *  referenciado por <code>otro</code>.
     *
     *  <p>
     *  El resultado es un valor:
     *  <ul>
     *     <li> negativo si el instante del objeto en curso 
     *     es anterior al de <code>otro</code>, </li>
     *     <li> cero si son iguales, </li>
     *     <li> positivo si el instante del objeto en curso 
     *     es posterior al de <code>otro</code>. </li>
     *  </ul>
     *  </p>
     */
    public int compareTo(TimeInstant otro) {
        return this.toMinutes() - otro.toMinutes();
        //return (minutes + hours * 60) - (otro.minutes + otro.hours * 60); 
    }
    
    // ACTIVIDAD EXTRA:
    /** Devuelve un <code>TimeInstant</code> a partir de la descripcion 
     *  textual (<code>String</code>) en formato "<code>hh:mm</code>".
     */
    public static TimeInstant valueOf(String hhmm) {
        int h = (hhmm.charAt(0) - '0') * 10 + (hhmm.charAt(1) - '0');
        int m = (hhmm.charAt(3) - '0') * 10 + (hhmm.charAt(4) - '0');
        return new TimeInstant(h, m);
    }
}
