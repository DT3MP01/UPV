
/**
 * Clase Tipo de Dato BonoMetro
 * 
 * @author IIP
 * @version Octubre 2015
 */

public class BonoMetro {
    public static final int BONO_10 = 10;
    //Un BonoMetro TIENE UN...
    private int numeroDeTiques;
  
    public BonoMetro(int n) { //Constructor específico. Contiene argumentos (n)
        this.numeroDeTiques = n; 
    }
    
    public BonoMetro() { //Constructor por defecto. Llama a BONO_10; BONO_10 = 10;
        this(BONO_10);
    }
    
    public int getNumeroDeTiques() { // GET = RETURN
        return numeroDeTiques; 
    }
    
    public void recargar(int cantidad) { //VOID = ESTABLECE VALOR
        numeroDeTiques += cantidad;  
    }
    
    public String toString() { ////Método para mostrar los valores de los atributos de este objeto.
        return "Bono con " + numeroDeTiques + " tiques"; 
    }
    
    public String picar() { 
        if (numeroDeTiques > 0) { 
            numeroDeTiques--; 
            return this.toString(); 
        } 
        else { // numeroDeTiques <= 0
            return "Bono agotado. ¡Recárgalo YA!"; 
        } 
    }
}
 
