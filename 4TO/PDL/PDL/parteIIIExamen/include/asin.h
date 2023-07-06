/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_ASIN_H_INCLUDED
# define YY_YY_ASIN_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    FALSE_ = 258,
    TRUE_ = 259,
    BOOL_ = 260,
    IF_ = 261,
    ELSE_ = 262,
    WHILE_ = 263,
    PRINT_ = 264,
    READ_ = 265,
    RETURN_ = 266,
    STRUCT_ = 267,
    MAS_ = 268,
    MENOS_ = 269,
    POR_ = 270,
    DIV_ = 271,
    ASIG_ = 272,
    IGUAL_ = 273,
    DIST_ = 274,
    MAYOR_ = 275,
    MAYORIGUAL_ = 276,
    MENOR_ = 277,
    MENORIGUAL_ = 278,
    AND_ = 279,
    OR_ = 280,
    NOT_ = 281,
    PUNTO_ = 282,
    LLAA_ = 283,
    LLAC_ = 284,
    CORA_ = 285,
    CORC_ = 286,
    PARA_ = 287,
    PARC_ = 288,
    PUNTOCOMA_ = 289,
    COMA_ = 290,
    LOOP_ = 291,
    COUNTING_ = 292,
    INT_ = 293,
    CTE_ = 294,
    ID_ = 295
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 10 "src/asin.y"

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

#line 119 "asin.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_ASIN_H_INCLUDED  */
