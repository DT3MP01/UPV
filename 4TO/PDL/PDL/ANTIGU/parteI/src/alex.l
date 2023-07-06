/*****************************************************************************/
/**  Ejemplo de FLEX: S E M - 1             2021-2022 <jbenedi@dsic.upv.es> **/
/*****************************************************************************/
%{
#include <stdio.h>
#include <string.h>
#include "asin.h"
#include "header.h"

#define  retornar(x) {if (verbosidad) ECHO; return x ; }
%}
/*-----------------------------------------------------------------------------
  Estas opciones evitan "warnings" innecesarios y permiten obtener el
  numero de linea actual en la variable global "yylineno".
-----------------------------------------------------------------------------*/
%option noinput       
%option nounput       
%option yylineno  

delimitador    [ \t\n]+
digito         [0-9]
entero         {digito}+
comentario     "//".*\n 
ID             [a-z][a-z0-9]*

%%
{delimitador}  { if (verbosidad) ECHO; }
{comentario}   { if (verbosidad) ECHO; }

false           { retornar(FALSE_);  } 
true            { retornar(TRUE_);   } 
bool            { retornar(BOOL_);   } 
int             { retornar(INT_);    }  
if              { retornar(IF_);     } 
else            { retornar(ELSE_);   } 
while           { retornar(WHILE_);    } 
print           { retornar(PRINT_);  }
read            { retornar(READ_);   } 
return          { retornar(RETURN_); } 
struct          { retornar(STRUCT_); }       

"+"	            { retornar (MAS_);        }
"-"             { retornar (MENOS_);      }
"*"             { retornar (POR_);        }
"/"             { retornar (DIV_);        }
"="             { retornar(ASIG_);        }
"=="            { retornar(IGUAL_);       } 
"!="            { retornar(DIST_);        } 
">"             { retornar(MAYOR_);       } 
">="            { retornar(MAYORIGUAL_);  }
"<"             { retornar(MENOR_);       } 
"<="            { retornar(MENORIGUAL_);  } 
"&&"            { retornar(AND_);         } 
"||"            { retornar(OR_);          } 
"!"             { retornar(NOT_);         }
"."             { retornar(PUNTO_);    } 

"{"             { retornar(LLAA_);      }
"}"             { retornar(LLAC_);      }
"["             { retornar(CORA_);      }
"]"             { retornar(CORC_);      }
"("             { retornar(PARA_);      }
")"             { retornar(PARC_);      }
";"             { retornar(PUNTOCOMA_); }
","             { retornar(COMA_);      }

{entero}       { ECHO; yylval.cent = atoi(yytext); retornar(CTE_); }
{ID}           { ECHO; yylval.ident = atoi(yytext); retornar(ID_); }
.	             { yyerror("Caracter desconocido");                  }

%%

