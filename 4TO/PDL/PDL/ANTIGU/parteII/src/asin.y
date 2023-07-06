%{
#include <stdio.h>
#include <string.h>
#include "header.h"
#include "libtds.h"


%}


%union {
        int cent; /* Valor de la cte numerica entera para el terminal "cte" */
        char *ident; /* Nombre del identificador */
        struct {
                int refe;
                int desp_r;
        }  CampoRegistro;
        struct {
                int refe;
                int talla;
        } ParamForm;
} 

%token

FALSE_ TRUE_ BOOL_ IF_ ELSE_ WHILE_ PRINT_ READ_ RETURN_ STRUCT_

MAS_ MENOS_ POR_ DIV_ ASIG_ IGUAL_ DIST_ MAYOR_ MAYORIGUAL_ MENOR_ MENORIGUAL_ AND_ OR_ NOT_ PUNTO_

LLAA_ LLAC_ CORA_ CORC_ PARA_ PARC_ PUNTOCOMA_ COMA_

%token <cent> INT_ CTE_
%token <ident> ID_

%type <cent> tipoSimple 
 
%type <cent> parametrosFormales parametrosActuales declaracionVariable declaracionFuncion declaracion
%type <cent> instruccionAsignacion listaDeclaraciones  listaParametrosActuales 
%type <CampoRegistro> listaCampos
%type <ParamForm> listaParametrosFormales
%type <cent> expresion expresionRelacional expresionIgualdad
%type <cent> expresionMultiplicativa expresionAditiva expresionSufija expresionUnaria
%type <cent> operadorAditivo operadorRelacional operadorIgualdad operadorLogico operadorUnario operadorMultiplicativo constante

%%

programa  
        : 
        {
                niv = 0;
                dvar = 0;
                cargaContexto(niv);
        } listaDeclaraciones {
                if ($2 == 0) { 
                    yyerror("El programa no tiene main");
                } else if ($2 > 1) { 
                    yyerror("El programa tiene mas de un main");
                } 
        }
        ;
listaDeclaraciones  
        : declaracion
        {
                $$ = $1;
        }
        | listaDeclaraciones declaracion
        {
                $$ = $1 + $2;
        }
        ;
declaracion
        : declaracionVariable
        {
                $$ = 0;
        } /* una variable no cuenta para nada con lo del main */
        | declaracionFuncion 
        {
                $$ = $1;
        } /*cuantas veces ha aparecido el main*/
        ;
declaracionVariable
        : tipoSimple ID_ PUNTOCOMA_
        {
                if (!insTdS($2, VARIABLE, $1, niv, dvar, -1)) {
                        yyerror("Identificador variable repetido");
                }
                else {
                        dvar += TALLA_TIPO_SIMPLE;
                }
        } 
        | tipoSimple ID_ CORA_ CTE_ CORC_ PUNTOCOMA_
        {
                int numelem = $4; /*Array length */
                if (numelem <= 0) {
                        yyerror("Talla inapropiada del array");
                        numelem = 0;
                }
                int refe = insTdA($1, numelem); /*Referencia en tabla de arrays*/
                /*Insertar en tabla de simbolos e incrementar desplazamiento relativo si OK */
                if (!insTdS($2, VARIABLE, T_ARRAY, niv, dvar, refe)) { 
                        yyerror("Identificador repetido");
                } else {
                        dvar += numelem * TALLA_TIPO_SIMPLE;
                } 
        }
        | STRUCT_ LLAA_ listaCampos LLAC_ ID_ PUNTOCOMA_
        {
                if (!insTdS($5, VARIABLE, T_RECORD, niv, dvar, $3.refe)) {
                        yyerror("Identificador repetido");
                } else {
                        dvar += $3.desp_r;
                }
        }
        ;
tipoSimple
        : INT_
        {
                $$ = T_ENTERO;
        }
        | BOOL_
        {
                $$ = T_LOGICO;
        }
        ;
listaCampos
        : tipoSimple ID_ PUNTOCOMA_
        {
                /* NO PUEDE DAR ERROR, NO HACE FALTA COMPROBAR NADA */
                $$.refe = insTdR(-1, $2, $1, 0);/* creamos campo de registro */
                $$.desp_r = TALLA_TIPO_SIMPLE; /* incrementar desplazamiento */
        }
        | listaCampos tipoSimple ID_ PUNTOCOMA_ 
        {
                $$.refe = $1.refe; /* pillamos valor antes */
                $$.desp_r = $1.desp_r; /*desplazamiento (AKA talla diapositivas)*/
                if (insTdR($1.refe,$3, $2, $1.desp_r) == -1)
                        yyerror("Campo ya existente en el registro");
                else {
                        $$.refe = $1.refe;
                        $$.desp_r = $1.desp_r + TALLA_TIPO_SIMPLE; /*incrementamos desplazamiento puesto que hay un campo nuevo*/
                }   
        }
declaracionFuncion
        : tipoSimple ID_ 
        {
                $<cent>$ = dvar;
                dvar = 0;
                niv++;
                cargaContexto(niv);
        } 
        PARA_ parametrosFormales PARC_ 
        {
                if (!insTdS($2, FUNCION, $1, niv - 1, -1, $5)) {
                        yyerror("Identificador de función repetido");
                } 
                if (strcmp($2, "main") == 0) { 
                        $<cent>$ = 1;
                } else { 
                        $<cent>$ = 0;
                } 
        } bloque 
        {
                if (verTdS) { 
                        mostrarTdS();
                } 
                descargaContexto(niv);
                niv--;
                dvar = $<cent>3;
                $$ =  $<cent>7;  
        }
        ;
parametrosFormales
        : /* cadena vacia */
        {
                $$ = insTdD(-1, T_VACIO);
        }
        | listaParametrosFormales 
        {
                $$ = $1.refe;
        }
        ;
listaParametrosFormales
        : tipoSimple ID_ 
        {
                $$.refe = insTdD(-1, $1);
                $$.talla = TALLA_TIPO_SIMPLE + TALLA_SEGENLACES;
                if (!insTdS($2, PARAMETRO, $1, niv, -$$.talla, -1)) { 
                        yyerror("Identificador del parámetro repetido");
                } 
        }
        | tipoSimple ID_ COMA_ listaParametrosFormales
        {
                $$.talla = $4.talla; /*Nueva parametro, incrementamos talla*/
                $$.refe = insTdD($4.refe, $1); /* nos quedamos con la referencia del nuevo parametro*/
                if (!insTdS($2, PARAMETRO, $1, niv, -($$.talla + TALLA_TIPO_SIMPLE), -1)) { 
                        yyerror("Identificador del parametro repetido");
                } else { 
                        $$.talla += TALLA_TIPO_SIMPLE;
                } 
        }
        ;
bloque
        : LLAA_ declaracionVariableLocal listaInstrucciones RETURN_ expresion 
        {
                INF func = obtTdD(-1);
                if (func.tipo != $5) {
                        yyerror("Error de tipos del return");
                }
        } PUNTOCOMA_ LLAC_
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
        {
                SIMB simb = obtTdS($1);
                if ($3 != T_ERROR) {
                        if (simb.t == T_ERROR) {
                                yyerror("Objeto no declarado");
                        } else if (simb.t != $3 && $3 != T_ERROR) {
                                yyerror("Error de tipos en la asignación");
                        } 
                } 
        }
        | ID_ CORA_ expresion CORC_ ASIG_ expresion PUNTOCOMA_
        {
                /* Sacamos simbolo e informacion del array dado el simbolo*/
                SIMB simb = obtTdS($1);
                if ($3 != T_ERROR && $6 != T_ERROR) {
                        if (simb.t == T_ERROR) {
                                yyerror("Objeto no declarado");
                        } else if (simb.t != T_ARRAY) { /* Tenemos que tratar con un array */
                                yyerror("El identificador debe ser de tipo \"array\"");
                        } else {
                                DIM dim = obtTdA(simb.ref);
                                if ($3 != T_ENTERO) { /* Se accede a los indicies con enteros */
                                        yyerror("El índice del array debe ser entero");
                                } else if ($6 != dim.telem) { /* La asignacion no coincide con el tipo del array */
                                        yyerror("Error de tipos en la asignación");
                                } 
                        }
                }
        }
        | ID_ PUNTO_ ID_ ASIG_ expresion PUNTOCOMA_
        {
                SIMB simb = obtTdS($1);
                if ($5 != T_ERROR) {
                        if (simb.t == T_ERROR)
                                yyerror("Objeto no declarado");
                        else if (simb.t != T_RECORD)
                                yyerror("El identificador debe ser de tipo struct");
                        else {
                                CAMP camp = obtTdR(simb.ref, $3);
                                if (camp.t != $5) { 
                                        yyerror("Error de tipos en la asignación");
                                }
                        }
                
                }
        }
        ;
instruccionEntradaSalida
        : READ_ PARA_ ID_ PARC_ PUNTOCOMA_
        { 
                SIMB simb = obtTdS($3);
                if (simb.t == T_ERROR) {
                        yyerror("Objeto no declarado");
                } else if (simb.t != T_ENTERO) {
                        yyerror("El argumento de read debe ser entero");
                }
        }
        | PRINT_ PARA_ expresion PARC_ PUNTOCOMA_
        {
                if ($3 != T_ENTERO) {
                        yyerror("La expresión de print debe ser entera");
                }
        } 
        ;
instruccionSeleccion
        : IF_ PARA_ expresion {
                if ($3 != T_LOGICO && $3 != T_ERROR) {
                        yyerror("La expresión del if debe ser de tipo lógico");
                } 
        } PARC_ instruccion ELSE_ instruccion
        ;
instruccionIteracion
        : WHILE_ PARA_ expresion
        {
                if ($3 != T_LOGICO && $3 != T_ERROR) {
                        yyerror("La expresión del while debe ser de tipo lógico");
                } 
        } PARC_ instruccion
        ;
expresion
        : expresionIgualdad
        {
                $$ = $1;
        }
        | expresion operadorLogico expresionIgualdad
        {
                if ($1 == T_ERROR || $3 == T_ERROR)
                        $$ = T_ERROR;
                else if ($1 != T_LOGICO || $3 != T_LOGICO) {
                        $$ = T_ERROR;
                        yyerror("Error en expresión lógica");
                } else {
                        $$ = T_LOGICO;
                }
        } 
        ;
expresionIgualdad
        : expresionRelacional
        {
                $$ = $1;
        }
        | expresionIgualdad operadorIgualdad expresionRelacional
        {
                if ($1 == T_ERROR || $3 == T_ERROR)
                        $$ = T_ERROR;
                else if (!(($1 == T_LOGICO && $3 == T_LOGICO) || ($1 == T_ENTERO && $3 == T_ENTERO))) {
                        $$ = T_ERROR;
                        yyerror("Error en expresión de igualad");
                } else {
                        $$ = T_LOGICO;
                }
        } 
        ;
expresionRelacional
        : expresionAditiva
        {
                $$ = $1;
        }
        | expresionRelacional operadorRelacional expresionAditiva
        {
                if ($1 == T_ERROR || $3 == T_ERROR)
                        $$ = T_ERROR;
                else if ($1 != T_ENTERO || $3 != T_ENTERO) {
                        $$ = T_ERROR;
                        yyerror("Error en expresión relacional");
                } else {
                        $$ = T_LOGICO;
                }
        } 
        ;
expresionAditiva
        : expresionMultiplicativa
        {
                $$ = $1;
        }
        | expresionAditiva operadorAditivo expresionMultiplicativa
        {
                if ($1 == T_ERROR || $3 == T_ERROR)
                        $$ = T_ERROR;
                else if ($1 != T_ENTERO || $3 != T_ENTERO) {
                        $$ = T_ERROR;
                        yyerror("Error en expresión aditiva");
                } else {
                        $$ = T_ENTERO;
                }
                $$.pos = creaVarTemp();
                /*************** Expresión a partir de un operador aritmetico */
                emite($2, crArgPos(niv, $1.pos),crArgPos(niv, $3.pos), crArgPos(niv, $$.pos));
        } 
        
        ;
expresionMultiplicativa
        : expresionUnaria
        {
                $$ = $1;
        } 
        | expresionMultiplicativa operadorMultiplicativo expresionUnaria
        {
                if ($1 == T_ERROR || $3 == T_ERROR)
                        $$ = T_ERROR;
                else if ($1 != T_ENTERO || $3 != T_ENTERO) {
                        $$ = T_ERROR;
                        yyerror("Error en expresión multiplicativa");
                } else {
                        $$ = T_ENTERO;
                }
        } 
expresionUnaria
        : expresionSufija
        {
                $$ = $1;
        } 
        | operadorUnario expresionUnaria
        {
                if ($2 == T_ERROR) { 
                        $$ = $2;
                } else if ($1 != $2) {
                        yyerror("Error en expresión unaria");
                        $$ = T_ERROR;
                } else { 
                        $$ = $2;
                } 
        } 
        ;
expresionSufija
        : constante                           
                { 
                        $$ = $1;        
                }
        | PARA_ expresion PARC_
                {
                        $$ = $2;               
                } 
        | ID_
                {
                        SIMB simb = obtTdS($1);
                        $$ = T_ERROR;
                        if (simb.t == T_ERROR) {
                                yyerror("Objeto no declarado");
                        }  else {
                                $$ = simb.t;
                        }  
                }                                  
        | ID_ PUNTO_ ID_ 
                {
                        SIMB simb = obtTdS($1);
                        $$ = T_ERROR;
                        if (simb.t == T_ERROR) {
                                yyerror("Objeto no declarado");
                        } else if (simb.t != T_RECORD) {
                                yyerror("El identificador no es una estructura");
                        }  else {
                                CAMP camp = obtTdR(simb.ref, $3);
                                if (camp.t == T_ERROR) { /*¿El campo está declarado?*/
                                        yyerror("Campo no declarado");
                                        $$ = T_ERROR;
                                } else
                                        $$ = camp.t;
                        }
                } 
        | ID_ CORA_ expresion CORC_
                {
                        SIMB simb = obtTdS($1);
                        $$ = T_ERROR;
                        if (simb.t == T_ERROR) {
                                yyerror("Objeto no declarado");
                        } else if (simb.t != T_ARRAY) {
                                yyerror("Variable no es un array");
                        } else if ($3 != T_ENTERO) { /* Indice entero */
                                yyerror("El indice del \"array\" debe ser entero");
                        } else {
                                DIM dim = obtTdA(simb.ref);
                                $$ = dim.telem;
                        }   
                } 
        | ID_ PARA_ parametrosActuales PARC_    
                {
                        SIMB simb = obtTdS($1);
                        $$ = T_ERROR;
                        INF inf = obtTdD(simb.ref);
                        if (simb.t == T_ERROR) {
                                yyerror("Objeto no declarado");
                        } else if (inf.tipo == T_ERROR) {
                                yyerror("El identificador no es una función");
                        } else {
                                if (cmpDom(simb.ref, $3) == 0) {
                                        yyerror("El dominio de los parámetros no coincide con el de la función");
                                } else {
                                        $$ = inf.tipo;
                                }
                        }   
                } 
        ;
constante
        : CTE_   { $$ = T_ENTERO;        } 
        | TRUE_  { $$ = T_LOGICO;        } 
        | FALSE_ { $$ = T_LOGICO;        } 
        ;
parametrosActuales
        : /* cadena vacia */
                {       
                        $$ = insTdD(-1, T_VACIO);
                } 
        | listaParametrosActuales
                {       
                        $$ = $1;
                } 
        ;
listaParametrosActuales
        : expresion 
                {   
                        $$ = insTdD(-1, $1);
                }
        | expresion COMA_ listaParametrosActuales
                {       
                        $$ = insTdD($3, $1);
                } 
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
        : MAS_  {$$ = ESUM;} 
        | MENOS_ {$$ = EDIF;} 
        ;
operadorMultiplicativo
        : POR_
        | DIV_
        ;
operadorUnario 
        : MAS_   { $$ = T_ENTERO;      } 
        | MENOS_ { $$ = T_ENTERO;    } 
        | NOT_   { $$ = T_LOGICO;      } 
        ; 
%%