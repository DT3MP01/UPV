#include <stdio.h>
#include <string.h>
#include <dirent.h>

int main (int argc, char *argv[]) {
    
    int i = 0;
    DIR *dir = opendir("");
    
    while (i < argc) {
        
        if (strcmp (argv[i], "-c") == 0) {
            printf("Argumento %i es Compilar\n", i);
        } else if (strcmp (argv[i], "-E") == 0) {
             printf("Argumento %i es Preprocesar\n", i);
        } else if (strcmp (argv[i], "-i") == 0) {
             printf("Argumento %i es Incluir %s\n", i, dir);
        }
        i++;
     }
}
