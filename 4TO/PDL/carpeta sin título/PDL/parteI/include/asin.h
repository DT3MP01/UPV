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
    INT_ = 261,
    IF_ = 262,
    ELSE_ = 263,
    WHILE_ = 264,
    PRINT_ = 265,
    READ_ = 266,
    RETURN_ = 267,
    STRUCT_ = 268,
    MAS_ = 269,
    MENOS_ = 270,
    POR_ = 271,
    DIV_ = 272,
    ASIG_ = 273,
    IGUAL_ = 274,
    DIST_ = 275,
    MAYOR_ = 276,
    MAYORIGUAL_ = 277,
    MENOR_ = 278,
    MENORIGUAL_ = 279,
    AND_ = 280,
    OR_ = 281,
    NOT_ = 282,
    PUNTO_ = 283,
    LLAA_ = 284,
    LLAC_ = 285,
    CORA_ = 286,
    CORC_ = 287,
    PARA_ = 288,
    PARC_ = 289,
    PUNTOCOMA_ = 290,
    COMA_ = 291,
    ID_ = 292,
    CTE_ = 293
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_ASIN_H_INCLUDED  */
