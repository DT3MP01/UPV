package updateSolEda.moduloAutorizacion;

import java.util.Scanner;
import java.util.Locale; 
import java.util.InputMismatchException;

/** Ejercicio 14 (c) - Programa que lanza la aplicacion: 
 *  Lee los datos del usuario (nombre y password) de teclado
 *  y presenta un menu, bien para "Registrar el usuario", 
 *  bien para "Comprobar si el usuario esta autorizado"
 */

public class TestModuloAutorizacion {  
    
    public static void main(String[] args) {
        Scanner tec = new Scanner(System.in).useLocale(Locale.US);      
        ModuloAutorizacion m = new ModuloAutorizacion();
        int op = 0;
        String user, pwd;
        do {
            op = menu(tec);
            switch(op) {
                case 1: // Registrar un nuevo usuario
                    System.out.print("\nNombre de usuario: ");
                    user = tec.nextLine();
                    System.out.print("\nPassword: ");
                    pwd = tec.nextLine();
                    try {
                        m.registrarUsuario(user, pwd);
                    } catch (UsuarioExistente e) {
                        System.out.println("Usuario " + user + " registrado!");
                    }              
                    break;
                   
                case 2: // Comprobar usuario
                    System.out.print("\nNombre de usuario: ");
                    user = tec.nextLine();
                    System.out.print("\nPassword: ");
                    pwd = tec.nextLine();
                    if (m.estaAutorizado(user, pwd)) {
                        System.out.println("... " + user + " autorizado\n");
                    }
                    else {
                        System.out.println("... " + user + " NO autorizado\n");
                    }
                    break;
            
                case 0: // Terminar  
                    System.out.println("\n\nFin!");
                    break;
                    
                default:
                    System.out.println("\nERROR: Opcion correcta en [0, 2]");
            }
        } while (op != 0);
    }

    // Muestra un menu de opciones por pantalla para 
    // que el usuario elija una de las opciones que
    // se le ofrecen
    private static int menu(Scanner tec) {
        System.out.println("------------- MENU --------------");
        System.out.println(" 0 para terminar");
        System.out.println(" 1 para registrar usuario");
        System.out.println(" 2 para comprobar autorizacion usuario");
        System.out.println("---------------------------------");        
        boolean hayError = true; 
        int opcion = 0;
        do {
            try {
                System.out.print("    Elige una opcion (en [0, 2]): ");
                opcion = tec.nextInt();
                if (opcion > 2 || opcion < 0) {
                    String s = "La opcion " + opcion + " no esta en [0, 2]"; 
                    throw new IllegalArgumentException(s);
                }
                hayError = false;
            } catch (InputMismatchException e1) {
                System.out.print("�Introduce un entero valido! "); 
                System.out.println("Intentalo de nuevo ...");
            } catch (IllegalArgumentException e2) {
                System.out.println(e2.getMessage() + "Intentalo de nuevo ...");
            } finally {
                tec.nextLine();
            }
        } while (hayError);      
        return opcion;
    }
        
}
