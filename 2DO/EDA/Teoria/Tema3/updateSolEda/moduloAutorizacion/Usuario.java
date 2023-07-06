package moduloAutorizacion;

/** Ejercicio 14 (a): clase de la Clave del Map que tiene el modulo 
 *  de autorizacion de la aplicacion de control de acceso a un 
 *  sistema de reservas. TIENE UN nombre y UN password de usuario
 */

public class Usuario {

    private String nombre, password;
    
    public Usuario(String n, String pwd) {
        nombre = n; 
        password = pwd;
    }
    
    public Usuario(String n) { this(n, null); }
    
    public String getNombre() { return nombre; }
    
    public String getPassword() { return password; }
    
    public boolean equals(Object otro) {
        return otro instanceof Usuario
               && this.nombre.equals(((Usuario) otro).nombre);
    }
    
    public int hashCode() { return nombre.hashCode(); }
    
    public String toString() { return nombre; }
}