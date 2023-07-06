package librerias.excepciones;

/** Excepcion de usuario para representar elemento no encontrado */

public class ElementoNoEncontrado extends Exception {
    
    public ElementoNoEncontrado(String mensaje) {
        super(mensaje);
    }
    
    public ElementoNoEncontrado() { super(); }
}
