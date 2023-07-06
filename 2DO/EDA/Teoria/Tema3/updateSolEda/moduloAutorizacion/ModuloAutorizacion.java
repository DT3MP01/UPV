package updateSolEda.moduloAutorizacion;

import librerias.estructurasDeDatos.modelos.Map;
import librerias.estructurasDeDatos.deDispersion.TablaHash;

/** Ejercicio 14 (b): clase que representa el modulo
 *  de (registro y) autorizacion de usuarios de una 
 *  aplicacion de control de acceso a un sistema de 
 *  reservas
 *  
 *  Se considera que un usuario esta autorizado si su 
 *  nombre se encuentra registrado y la contraseña que 
 *  proporciona para acceder al sistema de reservas 
 *  coincide con aquella que suministro al registrarse.
 *  Por ello, TIENE UN Map de Usuarios, donde cada clave 
 *  es el nombre de un usuario y su valor asociado es
 *  su password
 *  
 */

public class ModuloAutorizacion {
   
    private Map<Usuario, Usuario> m;
    
    public ModuloAutorizacion() {
        m = new TablaHash<Usuario, Usuario>(10);
    }
    
    public boolean estaAutorizado(String nombre, String pwd) {
        boolean res = false;
        Usuario uA = m.recuperar(new Usuario(nombre, pwd));
        if (uA != null) {
            if (uA.getPassword().equals(pwd)) { res = true; }
        }
        return res;
    }
    
    public void registrarUsuario(String nombre, String pwd) 
        throws UsuarioExistente {
        Usuario aRegistrar = new Usuario(nombre, pwd);
        Usuario u = m.recuperar(aRegistrar);
        if (u != null) {
            throw new UsuarioExistente("Usuario " + nombre + " ya registrado");
        }
        else { m.insertar(aRegistrar, aRegistrar); }
    }
}