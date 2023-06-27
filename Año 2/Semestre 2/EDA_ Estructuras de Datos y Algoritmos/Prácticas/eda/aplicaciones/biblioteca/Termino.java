package aplicaciones.biblioteca;

/**
 * Termino: clase de la Clave del Map que representa un termino del Indice
 * Analitico de una Biblioteca Digital.
 *
 * Para que sobrescriba eficientemente los metodos equals y hashCode de Object,
 * un Termino TIENE UN valorHash que almacena el resultado de la PRIMERA
 * invocacion al metodo hashCode de la clase sobre el. De esta forma, el valor
 * hash asociado a un Termino... * (a) solo se calcula una vez,
 * independientemente del numero de veces * que el metodo hashCode se aplique
 * sobre el; * (b) se puede usar en el metodo equals de la clase para comprobar
 * la * igualdad de dos terminos SOLO cuando sus valores Hash sean iguales.
 *
 * Ademas, para poder evaluar distintos metodos hashCode, un Termino TIENE UNA
 * baseHashCode que almacena la base en la que se calcula su valorHash
 *
 * @author (EDA)
 * @version (Curso 2019-2020)
 */
public class Termino {

    public static final int BASE_TRIVIAL = 1;
    public static final int BASE_JAVA_LANG_STRING = 31;
    public static final int BASE_MCKENZIE = 4;

    protected String termino;
    // por eficiencia: "caching the Hash code" o "Hash cache"
    protected int valorHash;
    // para evaluar distintos metodos hashCode, con distintas bases
    protected int baseHashCode;

    /**
     * Crea el Termino asociado a la palabra t y le asocia la base a emplear en
     * el metodo hashCode
     *
     * @param t
     * @param base
     */
    public Termino(String t, int base) {
        termino = t;
        baseHashCode = base;
        valorHash = 0;
    }

    /**
     * Crea el Termino asociado a la palabra t segun el estandar de Java
     *
     * @param t
     */
    public Termino(String t) {
        this(t, BASE_JAVA_LANG_STRING);
    }

    /**
     * Devuelve el valor Hash de un (this) Termino de forma eficiente, i.e. al
     * aplicar este metodo por PRIMERA vez sobre un Termino de longitud n
     * (this.termino.length()), calcula su valor Hash como sigue: this.valorHash
     * = this.termino.charAt[0] * this.baseHashCode^(n-1) +
     * this.termino.charAt[1] * this.baseHashCode^(n-2) + ... +
     * this.termino.charAt[n-1] Si NO es la primera vez que se aplica el metodo,
     * devuelve this.valorHash
     *
     * @return
     */
    @Override
    public int hashCode() {
        if (this.valorHash != 0) {
            return valorHash;
        }
        
        // COMPLETAR: calcular de res para this.termino en this.baseHashCode
        for (int i = 0; i < this.termino.length(); i++) {
            this.valorHash = this.baseHashCode * this.valorHash + this.termino.charAt(i);
        }
        /* FIN COMPLETAR */

        return this.valorHash;
    }

    /**
     * Comprueba si un (this) Termino es igual a otro de forma eficiente, i.e.
     * SOLO ejecuta el metodo equals de String cuando los valores Hash de uno y
     * otro Termino son iguales
     *
     * @param otro
     * @return
     */
    @Override
    public boolean equals(Object otro) {
        return otro instanceof Termino
                && this.valorHash == ((Termino) otro).valorHash
                && this.termino.equals(((Termino) otro).termino);
    }

    /**
     * Devuelve un String que representa un Termino en cierto formato texto
     *
     * @return
     */
    @Override
    public String toString() {
        return termino + " (" + valorHash + ")\n";
    }
}
