%{
	#include <stdio.h>
	#include "header.h"
	
%}

%token OPSUMA_ OPRESTA_ OPMULT_ OPDIV_ OPAND_ OPOR_ OPNOT_
%token COMPMAYOR_ COMPMENOR_ COMPMAYORIG_ COMPMENORIG_ OPIGUAL_ OPNOTIGUAL_ IGUAL_
%token WHILE_ IF_ ELSE_
%token INT_ BOOL_
%token READ_ PRINT_ RETURN_
%token CTE_ ID_ TRUE_ FALSE_ STRUCT_ PUNTO_
%token LLAVEA_  LLAVEC_ PARENTESISA_ PARENTESISC_ CORCHETEA_ CORCHETEC_ PUNTOCOMA_ COMA_

%%

programa
    : lista_declaraciones
    ;

lista_declaraciones
    : declaracion
    | lista_declaraciones declaracion
    ;

declaracion
    : declaracion_variable
    | declaracion_funcion
    ;

declaracion_variable
    : tipo_simple ID_ PUNTOCOMA_
    | tipo_simple ID_ CORCHETEA_ CTE_ CORCHETEC_ PUNTOCOMA_
	| STRUCT_ LLAVEA_ lista_campos LLAVEC_ ID_ PUNTOCOMA_
    ;

tipo_simple
    : INT_
    | BOOL_
    ;
lista_campos
	: tipo_simple ID_ PUNTOCOMA_
	| lista_campos tipo_simple ID_ PUNTOCOMA_
	;
		
declaracion_funcion
	: tipo_simple ID_ PARENTESISA_ parametros_formales PARENTESISC_ bloque
	;
		
parametros_formales
	:
	| lista_parametros_formales
	;

lista_parametros_formales
	: tipo_simple ID_
	| tipo_simple ID_ COMA_ lista_parametros_formales
	;
	
bloque
	: LLAVEA_ declaracion_variable_local lista_instrucciones RETURN_ expresion PUNTOCOMA_ LLAVEC_
	;
	
declaracion_variable_local
	:
	| declaracion_variable_local declaracion_variable
	;

lista_instrucciones
	:
	| lista_instrucciones instruccion
	;

instruccion
    : LLAVEA_ lista_instrucciones LLAVEC_
    | instruccion_asignacion
    | instruccion_seleccion
    | instruccion_entrada_salida
	| instruccion_iteracion
    ;

instruccion_asignacion
	: ID_ IGUAL_ expresion PUNTOCOMA_
	| ID_ CORCHETEA_ expresion CORCHETEC_ IGUAL_ expresion PUNTOCOMA_
	| ID_ PUNTO_ ID_ IGUAL_ expresion PUNTOCOMA_
	;
	
instruccion_entrada_salida
	: READ_ PARENTESISA_ ID_ PARENTESISC_ PUNTOCOMA_
	| PRINT_ PARENTESISA_ expresion PARENTESISC_ PUNTOCOMA_
	;
	
instruccion_seleccion
	: IF_ PARENTESISA_ expresion PARENTESISC_ instruccion ELSE_ instruccion
	;
	
instruccion_iteracion
	: WHILE_ PARENTESISA_ expresion PARENTESISC_ instruccion
	;

expresion
    : expresion_igualdad
    | expresion operador_logico expresion_igualdad
    ;
	
expresion_igualdad
	: expresion_relacional
	| expresion_igualdad operador_igualdad expresion_relacional
	;
	
expresion_relacional
	: expresion_aditiva
	| expresion_relacional operador_relacional expresion_aditiva
	;
	
expresion_aditiva
	: expresion_multiplicativa
	| expresion_aditiva operador_aditivo expresion_multiplicativa
	;
	
expresion_multiplicativa
	: expresion_unaria
	| expresion_multiplicativa operador_multiplicativo expresion_unaria
	;
	
expresion_unaria
	: expresion_sufija
	| operador_unario expresion_unaria
	;
	
expresion_sufija
	: constante
	| PARENTESISA_ expresion PARENTESISC_
	| ID_
	| ID_ PUNTO_ ID_
	| ID_ CORCHETEA_ expresion CORCHETEC_
	| ID_ PARENTESISA_ parametros_actuales PARENTESISC_
	;
	
constante
	: CTE_
	| TRUE_
	| FALSE_
	;

parametros_actuales
	: 
	|lista_parametros_actuales
	;
	
lista_parametros_actuales
	: expresion
	| expresion COMA_ lista_parametros_actuales
	;
	
operador_logico
	: OPAND_
	| OPOR_
	;
	
operador_igualdad
	: OPIGUAL_
	| OPNOTIGUAL_
	;
	
operador_relacional
	: COMPMAYOR_
	| COMPMENOR_
	| COMPMAYORIG_
	| COMPMENORIG_
	;
	
operador_aditivo
	: OPSUMA_
	| OPRESTA_
	;
	
operador_multiplicativo
	: OPMULT_
	| OPDIV_
	;
	
operador_unario
	: OPSUMA_
	| OPRESTA_
	| OPNOT_
	;



%%