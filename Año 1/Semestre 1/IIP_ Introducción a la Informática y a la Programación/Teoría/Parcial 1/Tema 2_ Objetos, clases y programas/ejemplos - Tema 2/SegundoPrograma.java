public class SegundoPrograma {

public static void main(String[] args) {
    // crear un Circulo estandar c1 e incrementar su radio un 30%
    Circulo c1 = new Circulo();
    c1.crece();
    // Crea un Circulo c2 con el radio, color y centro actuales de c1
    double radioC2 = c1.getRadio();
    String colorC2 = c1.getColor();
    int centroXC2 = c1.getCentroX(), centroYC2 = c1.getCentroY();
    Circulo c2 = new Circulo(radioC2, colorC2, centroXC2, centroYC2);
    // Crear una Pizarra estandar pEstandar y dibujar c2 en ella
    Pizarra pEstandar = new Pizarra();
    pEstandar.add(c2);
}
}