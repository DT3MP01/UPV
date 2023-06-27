%{
#include <stdio.h>
#include <string.h>
#include "header.h"
%}

%union {
        int cent; /* Valor de la cte numerica entera para el terminal "cte" */
        char *ident; /* Nombre del identificador */
} 

%token

FALSE_ TRUE_ BOOL_ IF_ ELSE_ WHILE_ PRINT_ READ_ RETURN_ STRUCT_

MAS_ MENOS_ POR_ DIV_ ASIG_ IGUAL_ DIST_ MAYOR_ MAYORIGUAL_ MENOR_ MENORIGUAL_ AND_ OR_ NOT_ PUNTO_

LLAA_ LLAC_ CORA_ CORC_ PARA_ PARC_ PUNTOCOMA_ COMA_

%token <cent> INT_ CTE_
%token <ident> ID_

%%

programa  
        : listaDeclaraciones
        ;
listaDeclaraciones  
        : declaracion
        | listaDeclaraciones declaracion
        ;
declaracion
        : declaracionVariable
        | declaracionFuncion
        ;
declaracionVariable
        : tipoSimple ID_ PUNTOCOMA_
        | tipoSimple ID_ CORA_ CTE_ CORC_ PUNTOCOMA_
        | STRUCT_ LLAA_ listaCampos LLAC_ ID_ PUNTOCOMA_
        ;
tipoSimple
        : INT_
        | BOOL_
        ;
listaCampos
        : tipoSimple ID_ PUNTOCOMA_
        | listaCampos tipoSimple ID_ PUNTOCOMA_ 
declaracionFuncion
        : tipoSimple ID_ PARA_ parametrosFormales PARC_ bloque
        ;
parametrosFormales
        : /* cadena vacia */
        | listaParametrosFormales 
        ;
listaParametrosFormales
        : tipoSimple ID_
        | tipoSimple ID_ COMA_ listaParametrosFormales
        ;
bloque
        : LLAA_ declaracionVariableLocal listaInstrucciones RETURN_ expresion PUNTOCOMA_ LLAC_
        ;
declaracionVariableLocal
        : /* cadena vacia */
        | declaracionVariableLocal declaracionVariable
        ;
listaInstrucciones
        : /* instruccion vacia */
        | listaInstrucciones instruccion
        ;
instruccion
        : LLAA_ listaInstrucciones LLAC_
        | instruccionAsignacion
        | instruccionSeleccion
        | instruccionEntradaSalida     
        | instruccionIteracion
        ;
instruccionAsignacion
        : ID_ ASIG_ expresion PUNTOCOMA_
        | ID_ CORA_ expresion CORC_ ASIG_ expresion PUNTOCOMA_
        | ID_ PUNTO_ ID_ ASIG_ expresion PUNTOCOMA_
        ;
instruccionEntradaSalida
        : READ_ PARA_ ID_ PARC_ PUNTOCOMA_
        | PRINT_ PARA_ expresion PARC_ PUNTOCOMA_
        ;
instruccionSeleccion
        : IF_ PARA_ expresion PARC_ instruccion ELSE_ instruccion
        ;
instruccionIteracion
        : WHILE_ PARA_ expresion PARC_ instruccion
        ;
expresion
        : expresionIgualdad
        | expresion operadorLogico expresionIgualdad
        ;
expresionIgualdad
        : expresionRelacional
        | expresionIgualdad operadorIgualdad expresionRelacional
        ;
expresionRelacional
        : expresionAditiva
        | expresionRelacional operadorRelacional expresionAditiva
        ;
expresionAditiva
        : expresionMultiplicativa
        | expresionAditiva operadorAditivo expresionMultiplicativa
        ;
expresionMultiplicativa
        : expresionUnaria
        | expresionMultiplicativa operadorMultiplicativo expresionUnaria
expresionUnaria
        : expresionSufija
        | operadorUnario expresionUnaria
        ;
expresionSufija
        : constante
        | PARA_ expresion PARC_
        | ID_
        | ID_ PUNTO_ ID_
        | ID_ CORA_ expresion CORC_
        | ID_ PARA_ parametrosActuales PARC_    
        ;
constante
        : CTE_
        | TRUE_
        | FALSE_  
        ;
parametrosActuales
        : /* cadena vacia */
        | listaParametrosActuales
        ;
listaParametrosActuales
        : expresion
        | expresion COMA_ listaParametrosActuales
        ;
operadorLogico
        : AND_
        | OR_
        ;
operadorIgualdad
        : IGUAL_
        | DIST_
        ;
operadorRelacional
        : MAYOR_
        | MENOR_ 
        | MAYORIGUAL_
        | MENORIGUAL_
        ;
operadorAditivo
        : MAS_  
        | MENOS_ 
        ;
operadorMultiplicativo
        : POR_
        | DIV_ 
        ;
operadorUnario 
        : MAS_  
        | MENOS_ 
        | NOT_   
        ; 
%%