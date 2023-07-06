#define TRUE 1
#define FALSE 0

extern int yylex() ;

extern FILE *yyin; /* Fichero de entrada */
extern int yylineno; /* Contador del numero de linea */

extern void yyerror(const char * msg) ;
/* Tratamiento de errores */
extern int verbosidad ;
