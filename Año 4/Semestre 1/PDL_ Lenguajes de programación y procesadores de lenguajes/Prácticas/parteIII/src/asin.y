%{
#include <stdio.h>
#include <string.h>
#include "header.h"
#include "libtds.h"
#include "libgci.h"
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
        struct {
                int tipo; /*tipo de la expresion*/
                int desp; /* desplazamiento en memoria */
        } exp; /*expresiones */
        struct {
                int arg1; /*argumento de LANS*/
                int arg2; /*argumento de LANS*/
        }auxprog;
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
%type <exp> expresion expresionRelacional expresionIgualdad
%type <exp> expresionMultiplicativa expresionAditiva expresionSufija expresionUnaria 
%type <exp> constante
%type <cent> operadorAditivo operadorRelacional operadorIgualdad operadorLogico operadorUnario operadorMultiplicativo 

%%

programa  
        : 
        {
                niv = 0;
                dvar = 0;
                si = 0;
                cargaContexto(niv);
                /****Variables globales****/
                $<auxprog>$.arg1 = creaLans(si);
                emite(INCTOP,crArgNul(),crArgNul(),crArgEnt(-1)); /*variables globales, pero no sabemos aun cuantas tenemos*/
                /****Salto a main******/
                $<auxprog>$.arg2 = creaLans(si);
                emite(GOTOS,crArgNul(),crArgNul(),crArgEtq(-1)); /*hay que saltar al main,si lo tiene*/
        } listaDeclaraciones {
                SIMB main = obtTdS("main"); /*sacamos la funcion main*/
                if ($2 == 0) { 
                    yyerror("El programa no tiene main");
                } else if ($2 > 1) { 
                    yyerror("El programa tiene mas de un main");
                }
                /****Completar variables globales**/
                completaLans($<auxprog>1.arg1, crArgEnt(dvar));
                /*saltamos al main*/
                completaLans($<auxprog>1.arg2, crArgEtq(main.d));
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
                /*Insertar en tabla de simbolos e incrementar desplazamiento relativo  */
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
                if (!insTdS($2, FUNCION, $1, niv - 1, si, $5)) {
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
        :{
                emite(PUSHFP,crArgNul(),crArgNul(),crArgNul()); /* apilamos fp en la pila */
                emite(FPTOP,crArgNul(),crArgNul(),crArgNul()); /* movemos fp arriba del todo de la pila */
                /*variables locales y temporales*/
                $<cent>$ = creaLans(si); /*cuantas variables temporales y vocales hay */
                emite(INCTOP,crArgNul(),crArgNul(),crArgEnt(-1));
        }  LLAA_ declaracionVariableLocal listaInstrucciones RETURN_ expresion
        {
                INF func = obtTdD(-1);
                /* espacio para las variables reservado OK */
                completaLans($<cent>1,crArgEnt(dvar));
                /* valor retorno,mirar el tema 5, basicamente es la funcion que hay en la diapo 5*/
                int accvalret = TALLA_SEGENLACES + func.tsp + TALLA_TIPO_SIMPLE;
                emite(EASIG,crArgPos(niv, $6.desp),crArgNul(),crArgPos(niv,-accvalret));
                /*liberar segmento de variables locales y temporales */
                emite(TOPFP, crArgNul(),crArgNul(),crArgNul()); /*desapilamos variables temporales y locales*/
                /*desapilar enlaces de control*/
                emite(FPPOP,crArgNul(),crArgNul(),crArgNul());

                if(func.tipo == T_ERROR) {
                        yyerror("Error en declaracion de funcion");
                }else if($6.tipo != T_ERROR && func.tipo != $6.tipo){
                        yyerror("Error de tipos del \"return\"");
                } 
                        
                if(strcmp(func.nom,"main") == 0){
                        emite(FIN,crArgNul(),crArgNul(),crArgNul()); /* fin del programa */
                }     
                else{
                        emite(RET,crArgNul(),crArgNul(),crArgNul()); /*return de una funcion */
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
                if ($3.tipo != T_ERROR) {
                        if (simb.t == T_ERROR) {
                                yyerror("Objeto no declarado");
                        } else if (simb.t != $3.tipo && $3.tipo != T_ERROR) {
                                yyerror("Error de tipos en la asignación");
                        } 
                } 
                emite(EASIG,crArgPos(niv,$3.desp),crArgNul(),crArgPos(simb.n,simb.d)); /*asignacion */
        }
        | ID_ CORA_ expresion CORC_ ASIG_ expresion PUNTOCOMA_
        {
                /* Sacamos simbolo e informacion del array dado el simbolo*/
                SIMB simb = obtTdS($1);
                if ($3.tipo != T_ERROR && $6.tipo != T_ERROR) {
                        if (simb.t == T_ERROR) {
                                yyerror("Objeto no declarado");
                        } else if (simb.t != T_ARRAY) { /* Tenemos que tratar con un array */
                                yyerror("El identificador debe ser de tipo \"array\"");
                        } else {
                                DIM dim = obtTdA(simb.ref);
                                if ($3.tipo != T_ENTERO) { /* Se accede a los indicies con enteros */
                                        yyerror("El índice del array debe ser entero");
                                } else if ($6.tipo != dim.telem) { /* La asignacion no coincide con el tipo del array */
                                        yyerror("Error de tipos en la asignación");
                                } 
                        }
                }
                emite(EVA,crArgPos(simb.n,simb.d),crArgPos(niv,$3.desp),crArgPos(niv,$6.desp));
        }
        | ID_ PUNTO_ ID_ ASIG_ expresion PUNTOCOMA_
        {
                SIMB simb = obtTdS($1);
                CAMP camp = obtTdR(simb.ref, $3);
                if ($5.tipo != T_ERROR) {
                        if (simb.t == T_ERROR)
                                yyerror("Objeto no declarado");
                        else if (simb.t != T_RECORD)
                                yyerror("El identificador debe ser de tipo struct");
                        else {
                                if (camp.t != $5.tipo) { 
                                        yyerror("Error de tipos en la asignación");
                                }
                        }
                        int d = simb.d + camp.d; /*sumamos desplazamientos*/
                        emite(EASIG,crArgPos(niv,$5.desp),crArgNul(),crArgPos(simb.n,d));
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
                emite(EREAD, crArgNul(), crArgNul(),crArgPos(simb.n , simb.d));
        }
        | PRINT_ PARA_ expresion PARC_ PUNTOCOMA_
        {
                if ($3.tipo != T_ENTERO) {
                        yyerror("La expresión de print debe ser entera");
                }
                emite(EWRITE, crArgNul(), crArgNul(), crArgPos(niv, $3.desp));
        } 
        ;


instruccionSeleccion
        : IF_ PARA_ expresion PARC_ {
                if($3.tipo != T_LOGICO && $3.tipo != T_ERROR)
                        yyerror("La expresion del \"if\" debe ser \"logico\"");
                $<cent>$ = creaLans(si); /*creamos la LANS*/
                emite(EIGUAL,crArgPos(niv,$3.desp),crArgEnt(0), crArgEtq(-1)); /*-1 para rellenar */
        } instruccion {
                $<cent>$ = creaLans(si);
                emite(GOTOS,crArgNul(),crArgNul(),crArgEtq(-1)); /*-1 para rellenar*/
                completaLans($<cent>5, crArgEtq(si)); /*saltamos en caso de ELSE */
        }ELSE_ instruccion{
                completaLans($<cent>7, crArgEtq(si));
        } 
        
        ;


instruccionIteracion
        : WHILE_ { $<cent>$ = si; /*direccion de expresion*/ }PARA_ expresion
        {
                if($4.tipo != T_LOGICO && $4.tipo != T_ERROR){
                        yyerror("La expresion del \"while\" debe ser \"logico\"");
                } 
                $<cent>$ = creaLans(si); /*nos guardamos la dir. del emite */
                emite(EIGUAL,crArgPos(niv,$4.desp),crArgEnt(0),crArgEtq(-1)); /*-1 para rellenar*/
        } PARC_ instruccion{
                emite(GOTOS,crArgNul(),crArgNul(),crArgEtq($<cent>2)); /*saltamos al inicio del bucle */
                completaLans($<cent>5,crArgEtq(si));/*completa la lista, tiene que saltar fuera */
        } 
        ;


expresion
        : expresionIgualdad
        {
               $$.tipo = $1.tipo; $$.desp = $1.desp;
        }
        | expresion operadorLogico expresionIgualdad
        {
                if ($1.tipo == T_ERROR || $3.tipo == T_ERROR) 
                   $$.tipo = T_ERROR;
                else if(!($1.tipo == T_LOGICO && $1.tipo == $3.tipo)) {
                    $$.tipo = T_ERROR;
                    yyerror("Error en \"expresion logica\"");
                }
                else
                    $$.tipo = T_LOGICO;
                
                $$.desp = creaVarTemp();
                emite($2, crArgPos(niv, $1.desp), crArgPos(niv, $3.desp), crArgPos(niv, $$.desp));
                if($2 == ESUM) {
                    /* si: if $$ <= 1 then goto si + 2 (diapositivas) */
                    emite(EMENEQ, crArgPos(niv, $$.desp), crArgEnt(1), crArgEtq(si + 2));
                    /*asignacion por si la suma da mayor que uno */
                    emite(EASIG, crArgEnt(1), crArgNul(), crArgPos(niv, $$.desp));
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
                if($1.tipo == T_ERROR || $3.tipo == T_ERROR)
                        $$.tipo = T_ERROR;
                else if(!(($1.tipo == T_LOGICO && $1.tipo == $3.tipo) || ($1.tipo == T_ENTERO && $1.tipo == $3.tipo) )) {
                        $$.tipo = T_ERROR;
                        yyerror("Error en \"expresion de igualdad\"");
                } else {
                        $$.tipo = T_LOGICO;
                }
                $$.desp = creaVarTemp();
                emite(EASIG,crArgEnt(1),crArgNul(), crArgPos(niv, $$.desp));
                emite($2, crArgPos(niv, $1.desp), crArgPos(niv, $3.desp), crArgEtq(si + 2));
                emite(EASIG,crArgEnt(0),crArgNul(), crArgPos(niv, $$.desp));
        } 
        ;
expresionRelacional
        : expresionAditiva
        {
                $$ = $1;
        }
        | expresionRelacional operadorRelacional expresionAditiva
        {
                if ($1.tipo == T_ERROR || $3.tipo == T_ERROR)
                        $$.tipo = T_ERROR;
                else if ($1.tipo != T_ENTERO || $3.tipo != T_ENTERO) {
                        $$.tipo = T_ERROR;
                        yyerror("Error en expresión relacional");
                } else {
                        $$.tipo = T_LOGICO;
                }
                $$.desp = creaVarTemp();
                /*asumimos true, si se cumple saltamos, si no se cumple es false y por tanto 0 */
                emite(EASIG,crArgEnt(1),crArgNul(), crArgPos(niv, $$.desp));
                emite($2, crArgPos(niv, $1.desp), crArgPos(niv, $3.desp), crArgEtq(si + 2));
                emite(EASIG,crArgEnt(0),crArgNul(), crArgPos(niv, $$.desp));
        } 
        ;
expresionAditiva
        : expresionMultiplicativa
        {
                $$ = $1;
        }
        | expresionAditiva operadorAditivo expresionMultiplicativa
        {
                if ($1.tipo == T_ERROR || $3.tipo == T_ERROR)
                        $$.tipo = T_ERROR;
                else if ($1.tipo != T_ENTERO || $3.tipo != T_ENTERO) {
                        $$.tipo = T_ERROR;
                        yyerror("Error en expresión aditiva");
                } else {
                        $$.tipo = T_ENTERO;
                }
                $$.desp = creaVarTemp();
                emite($2, crArgPos(niv, $1.desp),crArgPos(niv, $3.desp), crArgPos(niv, $$.desp));
        } 
        
        ;
expresionMultiplicativa
        : expresionUnaria
        {
                $$ = $1;
        } 
        | expresionMultiplicativa operadorMultiplicativo expresionUnaria
        {
                if($1.tipo == T_ERROR || $3.tipo == T_ERROR){
                        $$.tipo = T_ERROR;
                } 
                else if($1.tipo != T_ENTERO || $3.tipo != T_ENTERO) {
                        $$.tipo = T_ERROR;
                        yyerror("Error en \"expresion multiplicativa\"");
                }
                else {
                        $$.tipo = T_ENTERO;
                }
                $$.desp = creaVarTemp();
                emite($2, crArgPos(niv, $1.desp), crArgPos(niv, $3.desp), crArgPos(niv, $$.desp));
        } 
expresionUnaria
        : expresionSufija
        {
                $$ = $1;
        } 
        | operadorUnario expresionUnaria
        {
                if($2.tipo == T_ERROR){
                        $$.tipo = $2.tipo;
                } 
                
                // Revisar este tratamiento del error
                else if( ( ($1 == EASIG || $1 == ESIG) && $2.tipo != T_ENTERO) || ($1 == EDIF && $2.tipo!=T_LOGICO) )
                {
                        yyerror("Error en expresion unaria ");
                        $$.tipo = T_ERROR;
                }else {
                        $$.tipo = $2.tipo;
                }
                $$.desp = creaVarTemp();
                switch($1){
                        case EASIG:
                                // Se mantiene igual
                                emite($1, crArgPos(niv, $2.desp), crArgNul(), crArgPos(niv, $$.desp));
                                break;

                        case ESIG:
                                // Cambio de signo MENOS
                                emite($1, crArgPos(niv, $2.desp), crArgNul(), crArgPos(niv, $$.desp));
                                break;

                        case EDIF:
                                // Negación logica x=1-x
                                emite($1, crArgEnt(1), crArgPos(niv, $2.desp), crArgPos(niv, $$.desp));
                                break;
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
                        $$.tipo = T_ERROR;
                        if (simb.t == T_ERROR) {
                                yyerror("Objeto no declarado");
                        }  else {
                                $$.tipo = simb.t;
                        } 
                        $$.desp = creaVarTemp();
                        emite(EASIG, crArgPos(simb.n, simb.d), crArgNul(), crArgPos(niv, $$.desp));
                }                                  
        | ID_ PUNTO_ ID_ 
                {
                        SIMB simb = obtTdS($1);
                        CAMP camp = obtTdR(simb.ref, $3);
                        $$.tipo = T_ERROR;
                        if (simb.t == T_ERROR) {
                                yyerror("Objeto no declarado");
                        } else if (simb.t != T_RECORD) {
                                yyerror("El identificador no es una estructura");
                        }  else {
                                if (camp.t == T_ERROR) { /*¿El campo está declarado?*/
                                        yyerror("Campo no declarado");
                                        $$.tipo = T_ERROR;
                                } else
                                        $$.tipo = camp.t;
                        }
                        int d = simb.d + camp.d;
                        $$.desp = creaVarTemp();
                        emite(EASIG,crArgPos(simb.n,d), crArgNul(), crArgPos(niv, $$.desp));
                } 
        | ID_ CORA_ expresion CORC_
                {
                        SIMB simb = obtTdS($1);
                        DIM dim = obtTdA(simb.ref);
                        $$.tipo = T_ERROR;
                        if (simb.t == T_ERROR) {
                                yyerror("Objeto no declarado");
                        } else if (simb.t != T_ARRAY) {
                                yyerror("Variable no es un array");
                        } else if ($3.tipo != T_ENTERO) { /* Indice entero */
                                yyerror("El indice del \"array\" debe ser entero");
                        } else {
                                $$.tipo = dim.telem;
                        }
                        $$.desp = creaVarTemp(); 
                        emite(EAV, crArgPos(simb.n,simb.d), crArgPos(niv, $3.desp), crArgPos(niv, $$.desp));  
                } 
        | ID_{ 
                emite(EPUSH,crArgNul(),crArgNul(),crArgEnt(0));
          } PARA_ parametrosActuales PARC_    
                {
                        SIMB simb = obtTdS($1);
                        INF inf = obtTdD(simb.ref);
                        $$.tipo = T_ERROR;
                        if (simb.t == T_ERROR) {
                                yyerror("Objeto no declarado");
                        } else if (inf.tipo == T_ERROR) {
                                yyerror("El identificador no es una función");
                        } else {
                                if (cmpDom(simb.ref, $4) == 0) {
                                        yyerror("El dominio de los parámetros no coincide con el de la función");
                                } else {
                                        $$.tipo = inf.tipo;
                                }
                        }
                        $$.desp = creaVarTemp();
                        /**llamada a la funcion**/
                        emite(CALL, crArgNul(), crArgNul(), crArgEtq(simb.d));
                        /** desapilar segmento de parametros**/
                        emite(DECTOP,crArgNul(),crArgNul(),crArgEnt(inf.tsp));
                        /**desapilar y asignar valor de retorno*/
                        emite(EPOP,crArgNul(),crArgNul(),crArgPos(niv, $$.desp));   
                } 
        ;
constante:
        CTE_          { $$.tipo = T_ENTERO; 
                        $$.desp=creaVarTemp();
                        emite(EASIG,crArgEnt($1),crArgNul(),crArgPos(niv,$$.desp)); } 
        | TRUE_         { $$.tipo = T_LOGICO;
                          $$.desp=creaVarTemp();
                          emite(EASIG,crArgEnt(1),crArgNul(),crArgPos(niv,$$.desp));} 
        | FALSE_        { $$.tipo = T_LOGICO;
                          $$.desp=creaVarTemp();
                          emite(EASIG,crArgEnt(0),crArgNul(),crArgPos(niv,$$.desp));} 
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
                        $$ = insTdD(-1, $1.tipo); 
                        emite(EPUSH,crArgNul(),crArgNul(),crArgPos(niv,$1.desp));
                }
        | expresion {
                emite(EPUSH,crArgNul(),crArgNul(),crArgPos(niv,$1.desp));
                } COMA_ listaParametrosActuales  
                {       
                        $$ = insTdD($4, $1.tipo);
                } 
        ;

operadorLogico
        : AND_   { $$ = EMULT; }
        | OR_    { $$ = ESUM; }
        ;
operadorIgualdad
        : IGUAL_    { $$ = EIGUAL; }
        | DIST_     { $$ = EDIST; }  
        ;
operadorRelacional
        : MAYOR_   { $$ = EMAY; }
        | MENOR_   { $$ = EMEN; }
        | MAYORIGUAL_   { $$ = EMAYEQ; }
        | MENORIGUAL_   { $$ = EMENEQ; } 
        ;
operadorAditivo
        : MAS_  {$$ = ESUM;} 
        | MENOS_ {$$ = EDIF;} 
        ;
operadorMultiplicativo
        : POR_   { $$ = EMULT; }
        | DIV_   { $$ = EDIVI; }
        ;
operadorUnario 
        : MAS_   { $$ = EASIG;      } 
        | MENOS_ { $$ = ESIG;    } 
        | NOT_   { $$ = EDIF;      } 
        ; 
%%