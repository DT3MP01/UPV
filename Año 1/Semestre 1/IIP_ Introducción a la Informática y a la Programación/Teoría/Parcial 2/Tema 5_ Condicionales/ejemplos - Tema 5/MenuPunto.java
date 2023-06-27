import java.util.Scanner;

/**
 * Clase MenuPunto: programa en el que la opcion de un menu
 * determina las operaciones a realizar sobre uno punto dado
 */
public class MenuPunto {
    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        PuntoR p = new PuntoR(1.5, 3.0);
        
        System.out.println(" MENU");
        System.out.println("1. Distancia al origen");
        System.out.println("2. Mover aleatorio");
        System.out.println("3. Datos del punto");
        System.out.print("\nElige una opcion: ");
        int opc = teclado.nextInt();
        
        switch (opc) {
            case 1: 
                double d = p.distOrigen();
                System.out.printf("Distancia = %4.2f al origen \n" + d);
                break;
            case 2: 
                p.moverAleat();
                System.out.println("Punto desplazado " + p.toString());
                break;
            case 3: 
                System.out.println("Datos del punto: " + p.toString());
                break;
            default: 
                System.out.println("Opcion no valida");
        }
    }
}
