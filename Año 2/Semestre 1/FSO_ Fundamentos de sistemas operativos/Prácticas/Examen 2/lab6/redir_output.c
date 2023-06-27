// redir_output.c
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

int main (int argc,char *argv[]) {
    int fd;
    char *arch = "output.txt";
    mode_t fd_mode = S_IRWXU;// file premissions

    fd = open(arch, O_RDWR | O_CREAT, fd_mode); //fd = 3 en tabla de descriptores
    if (dup2(fd, STDOUT_FILENO) == -1) { //fd = STDOUT_FILENO = 1 en tabla de descriptores
        printf("Error calling dup2\n");
        exit(-1);
    }

    fprintf(stdout,"Men1\n");
    fprintf(stderr,"Men2\n");
    fprintf(stderr,"Men3\n");
    close(fd);
    return(0);
}


