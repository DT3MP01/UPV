package ejemplos.tema1;


/**
 * Write a description of class we here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class we {
    public static void main(String args[]) {
        int[]de = {-3,-2,-1,1,2,3};

        System.out.println(pos (de,0,5));
    }

    public static int pos (int[] list,int ini,int fin){
        if(fin==ini){return ini;}
        int mitad=(fin+ini)/2;
        if(list[mitad]>0){         
            return pos(list,ini,mitad);}
        else{
            if(list[mitad+1]>0){return mitad;}
            else{return pos(list,mitad+1,fin);
            }
        }
    }
}
