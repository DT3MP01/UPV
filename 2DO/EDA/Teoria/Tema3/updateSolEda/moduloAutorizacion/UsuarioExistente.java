package moduloAutorizacion;

/** Ejercicio 14 (b): clase de la excepcion que lanza el modulo de 
 *  autorizacion cuando un usuario intenta registrarse con un password
 *  distinto del autorizado
 */

public class UsuarioExistente extends Exception {

    public UsuarioExistente() { super(); }  
    
    public UsuarioExistente(String msg) { super(msg); }  
}
