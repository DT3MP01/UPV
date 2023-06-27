package pract3;

import java.util.Locale;
import java.util.Random;
/** Classe MeasuringSortingAlgorithms: Estudi empiric de costs 
 *  dels metodes d'ordenacio.
 *  @author PRG - ETSInf
 *  @version Curs 2017-2018
 */
public class MeasuringSortingAlgorithms {
    // Constants que defineixen els parametres de mesura
    public static final int MAXTALLA = 10000, INITALLA = 1000; 
    public static final int INCRTALLA = 1000;
    public static final int REPETICIONSQ = 200, REPETICIONSL = 20000;
    public static final double NMS = 1e3;  // relacio micro - nanosegons
    public static final int INITALLA_MERGE = (int) Math.pow(2,10),MAXTALLA_MERGE = (int) Math.pow(2,19);
    public static final int INCRTALLA_MERGE = 2;
    
    /** No hi ha objectes d'aquesta classe. */
    private MeasuringSortingAlgorithms() { }
    
    /** Crea un array d'int de talla t amb valors a 0.
     *  @param t int, la talla.
     *  @result int[], l'array generat.
     */
    private static int[] createArray(int t) { 
        int[] a = new int[t];
        return a;
    }
  
    /** Omple els elements d'un array a d'int amb
     *  valors aleatoris entre 0 i a.length-1.
     *  @param a int[], l'array.
     */
    private static void fillRandomArray(int[] a) {
        int Min = 0;
        int Max = a.length;
        for (int i = 0; i < a.length; i++) {
            a[i] = Min + (int)(Math.random() * ((Max - Min) + 1));
        }
    }
    
    /** Omple els elements d'un array a de forma creixent,
     *  amb valors des de 0 fins a.length-1.
     *  @param a int[], l'array.
     */
    private static void fillArraySortedInAscendingOrder(int[] a) { 
        for (int i = 0; i < a.length; i++) {
            a[i] = i;
        }
    }

    /** Omple els elements d'un array a de forma decreixent,
     *  amb valors des de a.length-1 fins 0.
     *  @param a int[], l'array.
     */
    private static void fillArraySortedInDescendingOrder(int[] a) { 
        for (int i = a.length - 1; i >= 0; i--) {
            a[i] = a.length - 1 - i;
        }
    }

    public static void measuringSelectionSort() { 
        long ti = 0, tf = 0, tt = 0; // Temps inicial, final i total 
        // Imprimir capçalera de resultats
        System.out.println("# Selecció directa. Temps en microsegons");
        System.out.print("# Talla    Promedi \n");
        System.out.print("#------------------\n");
        
        for (int t = INITALLA; t <= MAXTALLA; t += INCRTALLA) {
            // Crear l'array
            int[] a = createArray(t);
            fillRandomArray(a);
      
            // Estudi del cas millor: cercar a[0]
            // OJO: Com es molt rapid, 
            // el numero de repeticions es major
            tt = 0;                          // Temps acumulat inicial a 0
            for (int r = 0; r < REPETICIONSQ; r++) {
                ti = System.nanoTime();      // Temps inicial
                MeasurableAlgorithms.selectionSort(a);
                tf = System.nanoTime();      // Temps final
                tt += (tf - ti);             // Actualitzar temps acumulat
            }
            double tPromed = (double) tt / REPETICIONSQ; // Temps promedi 

            System.out.printf(Locale.US, "%8d %12f\n", 
                              t, tPromed / NMS);
        }
    }

    public static void measuringInsertionSort() { 
        long ti = 0, tf = 0, tt = 0; // Temps inicial, final i total        
        // Imprimir capçalera de resultats
        System.out.println("# Inserció directa. Temps en microsegons");
        System.out.print("# Talla      Millor     Pitjor    Promedi\n");
        System.out.print("#----------------------------------------\n");

        int[] a;
        // Aquest bucle repeteix el proces per a distintes talles
        for (int t = INITALLA; t <= MAXTALLA; t += INCRTALLA) {
            // Crear l'array
            a = createArray(t);
            // Estudi del cas millor: cercar a[0]
            // OJO: Com es molt rapid, 
            // el numero de repeticions es major
            tt = 0;                          // Temps acumulat inicial a 0
            for (int r = 0; r < REPETICIONSL; r++) {
                fillArraySortedInAscendingOrder(a);
                ti = System.nanoTime();      // Temps inicial
                MeasurableAlgorithms.insertionSort(a);
                tf = System.nanoTime();      // Temps final
                tt += (tf - ti);             // Actualitzar temps acumulat
            }
            double tMillor = (double) tt / REPETICIONSL; // Temps promedi 
                                                          // del cas millor
            
            // Estudi del cas pitjor: cercar un que no estiga, per exemple -1
            tt = 0;                          // Temps acumulat inicial a 0
            for (int r = 0; r < REPETICIONSQ; r++) {
                fillArraySortedInDescendingOrder(a);
                ti = System.nanoTime();      // Temps inicial
                MeasurableAlgorithms.insertionSort(a);
                tf = System.nanoTime();      // Temps final
                tt += (tf - ti);             // Actualitzar temps acumulat
            }
            double tPitjor = (double) tt / REPETICIONSQ;  // Temps promedi 
                                                         // del cas pitjor
            
            // Estudi del cas promedi: cercar un numero aleatori entre 0 i t-1
            tt = 0;                        // Temps acumulat inicial a 0
            for (int r = 0; r < REPETICIONSQ; r++) {
                fillRandomArray(a);
                int aux = (int) Math.floor(Math.random() * t); // valor a cercar
                ti = System.nanoTime();  // Temps inicial
                MeasurableAlgorithms.insertionSort(a);
                tf = System.nanoTime();  // Temps final
                tt += (tf - ti);         // Actualitzar temps acumulat
            }
            double tPromed = (double) tt / REPETICIONSQ; // Temps promedi 
                                                        // del cas promedi

            // Imprimir resultats
            System.out.printf(Locale.US, "%8d %10.3f %10.3f %10.3f\n", 
                              t, tMillor / NMS, tPitjor / NMS, tPromed / NMS);
        }
    }
  
    public static void measuringMergeSort() {        
        long ti = 0, tf = 0, tt = 0; // Temps inicial, final i total        
        // Imprimir capçalera de resultats
        System.out.println("# Mergesort. Temps en microsegons");
        System.out.print("# Talla      Millor     Pitjor    Promedi\n");
        System.out.print("#----------------------------------------\n");

        int[] a;
        // Aquest bucle repeteix el proces per a distintes talles
        for (int t = INITALLA_MERGE; t <= MAXTALLA_MERGE; t *= INCRTALLA_MERGE) {
            // Crear l'array
            a = createArray(t);
            // Estudi del cas millor: cercar a[0]
            // OJO: Com es molt rapid, 
            // el numero de repeticions es major
            tt = 0;                          // Temps acumulat inicial a 0
            for (int r = 0; r < REPETICIONSL; r++) {
                fillArraySortedInAscendingOrder(a);
                ti = System.nanoTime();      // Temps inicial
                MeasurableAlgorithms.mergeSort(a, 0, a.length-1);
                tf = System.nanoTime();      // Temps final
                tt += (tf - ti);             // Actualitzar temps acumulat
            }
            double tMillor = (double) tt / REPETICIONSL; // Temps promedi 
                                                          // del cas millor
            
            // Estudi del cas pitjor: cercar un que no estiga, per exemple -1
            tt = 0;                          // Temps acumulat inicial a 0
            for (int r = 0; r < REPETICIONSQ; r++) {
                fillArraySortedInDescendingOrder(a);
                ti = System.nanoTime();      // Temps inicial
                MeasurableAlgorithms.mergeSort(a, 0, a.length-1);
                tf = System.nanoTime();      // Temps final
                tt += (tf - ti);             // Actualitzar temps acumulat
            }
            double tPitjor = (double) tt / REPETICIONSQ;  // Temps promedi 
                                                         // del cas pitjor
            
            // Estudi del cas promedi: cercar un numero aleatori entre 0 i t-1
            tt = 0;                        // Temps acumulat inicial a 0
            for (int r = 0; r < REPETICIONSQ; r++) {
                fillRandomArray(a);
                int aux = (int) Math.floor(Math.random() * t); // valor a cercar
                ti = System.nanoTime();  // Temps inicial
                MeasurableAlgorithms.mergeSort(a, 0, a.length-1);
                tf = System.nanoTime();  // Temps final
                tt += (tf - ti);         // Actualitzar temps acumulat
            }
            double tPromed = (double) tt / REPETICIONSQ; // Temps promedi 
                                                        // del cas promedi

            // Imprimir resultats
            System.out.printf(Locale.US, "%8d %10.3f %10.3f %10.3f\n", 
                              t, tMillor / NMS, tPitjor / NMS, tPromed / NMS);
        }
    }

    public static void help() {
        String msg = "Us: java MeasurigSortingAlgorithms num_algorisme";
        System.out.println(msg);
        System.out.println("   on num_algorisme es:");
        System.out.println("   1 -> Insercio");
        System.out.println("   2 -> Seleccio");
        System.out.println("   3 -> MergeSort");
    }

    public static void main(String[] args) {        
        if (args.length != 1) { help(); }
        else {
            try {
                int a = Integer.parseInt(args[0]);
                switch (a) {
                    case 1: 
                        measuringInsertionSort();
                        break;
                    case 2: 
                        measuringSelectionSort();
                        break;
                    case 3: 
                        measuringMergeSort();
                        break;
                    default: 
                        help();
                }
            } catch (Exception e) {
                help(); 
            }
        }
    }
}