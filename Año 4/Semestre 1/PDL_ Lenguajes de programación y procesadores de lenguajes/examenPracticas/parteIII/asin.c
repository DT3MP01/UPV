/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.5.1"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 1 "src/asin.y"

#include <stdio.h>
#include <string.h>
#include "header.h"
#include "libtds.h"
#include "libgci.h"

#line 78 "asin.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Use api.header.include to #include this header
   instead of duplicating it here.  */
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
    FROM_ = 291,
    TO_ = 292,
    DO_ = 293,
    INT_ = 294,
    CTE_ = 295,
    ID_ = 296
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

#line 193 "asin.c"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_ASIN_H_INCLUDED  */



#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))

/* Stored state numbers (used for stacks). */
typedef yytype_uint8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && ! defined __ICC && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                            \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  3
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   161

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  42
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  48
/* YYNRULES -- Number of rules.  */
#define YYNRULES  90
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  168

#define YYUNDEFTOK  2
#define YYMAXUTOK   296


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    59,    59,    59,    84,    88,    94,    98,   105,   114,
     129,   139,   143,   150,   156,   170,   177,   169,   199,   202,
     208,   216,   228,   235,   228,   263,   264,   267,   268,   271,
     272,   273,   274,   275,   276,   280,   292,   312,   332,   342,
     353,   358,   353,   370,   371,   370,   386,   397,   386,   411,
     416,   440,   444,   461,   465,   483,   487,   503,   507,   523,
     527,   562,   566,   570,   582,   602,   619,   619,   647,   650,
     653,   660,   663,   670,   675,   675,   684,   685,   688,   689,
     692,   693,   694,   695,   698,   699,   702,   703,   706,   707,
     708
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "FALSE_", "TRUE_", "BOOL_", "IF_",
  "ELSE_", "WHILE_", "PRINT_", "READ_", "RETURN_", "STRUCT_", "MAS_",
  "MENOS_", "POR_", "DIV_", "ASIG_", "IGUAL_", "DIST_", "MAYOR_",
  "MAYORIGUAL_", "MENOR_", "MENORIGUAL_", "AND_", "OR_", "NOT_", "PUNTO_",
  "LLAA_", "LLAC_", "CORA_", "CORC_", "PARA_", "PARC_", "PUNTOCOMA_",
  "COMA_", "FROM_", "TO_", "DO_", "INT_", "CTE_", "ID_", "$accept",
  "programa", "@1", "listaDeclaraciones", "declaracion",
  "declaracionVariable", "tipoSimple", "listaCampos", "declaracionFuncion",
  "@2", "@3", "parametrosFormales", "listaParametrosFormales", "bloque",
  "@4", "$@5", "declaracionVariableLocal", "listaInstrucciones",
  "instruccion", "instruccionAsignacion", "instruccionEntradaSalida",
  "instruccionSeleccion", "@6", "@7", "instruccionIteracion", "@8", "@9",
  "instruccionIteracion2", "@10", "@11", "expresion", "expresionIgualdad",
  "expresionRelacional", "expresionAditiva", "expresionMultiplicativa",
  "expresionUnaria", "expresionSufija", "$@12", "constante",
  "parametrosActuales", "listaParametrosActuales", "$@13",
  "operadorLogico", "operadorIgualdad", "operadorRelacional",
  "operadorAditivo", "operadorMultiplicativo", "operadorUnario", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_int16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296
};
# endif

#define YYPACT_NINF (-76)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-75)

#define yytable_value_is_error(Yyn) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     -76,     1,    -3,   -76,   -76,   -22,   -76,    -3,   -76,   -76,
     -33,   -76,     6,   -76,   -13,   -25,    15,   -18,   -76,     7,
       9,   -10,    12,    28,     6,   -76,    37,    56,    60,    33,
      68,   -76,   -76,   -76,   -76,    76,   -76,     6,   -76,   -76,
     -76,    85,   -76,    -3,   -76,    83,    19,   -13,    95,   -76,
      97,    98,     0,   -76,    87,   -12,   -76,   -76,   -76,   -76,
     -76,   -76,     0,    99,     0,    91,   -76,   -76,   -76,   -76,
     -76,     0,   -76,    80,    32,   102,    96,   109,   110,   -76,
     -76,   -76,     0,    40,   116,     0,    93,     0,    67,     0,
      71,   103,    81,    94,     0,   105,   -76,   -76,   104,     0,
     -76,   -76,     0,   -76,   -76,   -76,   -76,     0,   -76,   -76,
       0,   -76,   -76,     0,   -76,   -76,     0,    27,   122,    55,
     -76,    32,   106,   107,   -76,   -76,    84,     0,   113,   102,
      96,   109,   110,   -76,    32,   -76,     0,   126,    57,   111,
     -76,   -76,   -76,    -1,   112,   -76,   -76,   114,    48,     0,
     -76,    57,   115,   -76,     0,   -76,    53,   139,   -76,     0,
      32,   -76,    57,   -76,   117,   -76,    57,   -76
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       2,     0,     0,     1,    12,     0,    11,     3,     4,     6,
       0,     7,     0,     5,    15,     0,     0,     0,     8,     0,
       0,     0,     0,     0,    18,    13,     0,     0,     0,     0,
       0,    19,    10,    14,     9,    20,    16,     0,    22,    21,
      17,     0,    25,    27,    26,     0,     0,     0,     0,    43,
       0,     0,     0,    27,     0,     0,    28,    30,    32,    31,
      33,    34,     0,     0,     0,     0,    70,    69,    88,    89,
      90,     0,    68,    63,    23,    49,    51,    53,    55,    57,
      59,    61,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    76,    77,     0,     0,
      78,    79,     0,    80,    82,    81,    83,     0,    84,    85,
       0,    86,    87,     0,    60,    29,     0,     0,     0,     0,
      40,    44,     0,     0,    62,    64,     0,    71,     0,    50,
      52,    54,    56,    58,    46,    35,     0,     0,     0,     0,
      39,    38,    65,    73,     0,    72,    24,     0,     0,     0,
      41,     0,     0,    67,     0,    37,     0,     0,    45,     0,
      47,    36,     0,    75,     0,    42,     0,    48
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
     -76,   -76,   -76,   -76,   140,   118,    46,   -76,   -76,   -76,
     -76,   -76,   119,   -76,   -76,   -76,   -76,   100,   -63,   -76,
     -76,   -76,   -76,   -76,   -76,   -76,   -76,   -76,   -76,   -76,
     -52,    49,    47,    45,    44,   -75,   -76,   -76,   -76,   -76,
      -2,   -76,   -76,   -76,   -76,   -76,   -76,   -76
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     1,     2,     7,     8,     9,    10,    16,    11,    19,
      38,    30,    31,    40,    41,    98,    43,    46,    56,    57,
      58,    59,   138,   157,    60,    63,   139,    61,   147,   164,
     143,    75,    76,    77,    78,    79,    80,    95,    81,   144,
     145,   152,    99,   102,   107,   110,   113,    82
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      74,     3,     4,    66,    67,    85,    12,   114,    14,     5,
      88,     4,    90,    68,    69,    86,    20,    17,    87,    92,
       4,    18,    23,    96,    97,    48,    70,    49,    50,    51,
      52,    26,    71,   117,   -74,   119,     6,   121,   133,    24,
      72,    73,   126,    25,    21,     6,    48,    53,    49,    50,
      51,    96,    97,    27,     6,    54,    96,    97,    15,    28,
      55,   135,    22,    48,   134,    49,    50,    51,    53,   115,
      29,    32,    96,    97,    35,   150,    54,    96,    97,    96,
      97,    55,   155,    29,   148,    53,   137,   161,   158,    45,
      33,    96,    97,    54,    34,    96,    97,   156,    55,   165,
     120,    36,   160,   167,   122,    96,    97,    93,    96,    97,
      94,    37,   -66,    42,   124,   142,   103,   104,   105,   106,
     100,   101,   108,   109,    47,   111,   112,    62,    84,    64,
      65,    89,    91,   116,   118,   125,   123,   127,   128,   136,
     140,   141,   146,   149,   151,   153,   162,    13,   129,   130,
     159,   154,   131,    83,   132,   166,    39,   163,     0,     0,
       0,    44
};

static const yytype_int16 yycheck[] =
{
      52,     0,     5,     3,     4,    17,    28,    82,    41,    12,
      62,     5,    64,    13,    14,    27,    41,    30,    30,    71,
       5,    34,    40,    24,    25,     6,    26,     8,     9,    10,
      11,    41,    32,    85,    35,    87,    39,    89,   113,    32,
      40,    41,    94,    34,    29,    39,     6,    28,     8,     9,
      10,    24,    25,    41,    39,    36,    24,    25,    12,    31,
      41,    34,    16,     6,   116,     8,     9,    10,    28,    29,
      24,    34,    24,    25,    41,   138,    36,    24,    25,    24,
      25,    41,    34,    37,   136,    28,    31,    34,   151,    43,
      34,    24,    25,    36,    34,    24,    25,   149,    41,   162,
      33,    33,   154,   166,    33,    24,    25,    27,    24,    25,
      30,    35,    32,    28,    33,    31,    20,    21,    22,    23,
      18,    19,    13,    14,    41,    15,    16,    32,    41,    32,
      32,    32,    41,    17,    41,    41,    33,    32,    34,    17,
      34,    34,    29,    17,    33,    33,     7,     7,    99,   102,
      35,    37,   107,    53,   110,    38,    37,   159,    -1,    -1,
      -1,    43
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,    43,    44,     0,     5,    12,    39,    45,    46,    47,
      48,    50,    28,    46,    41,    48,    49,    30,    34,    51,
      41,    29,    48,    40,    32,    34,    41,    41,    31,    48,
      53,    54,    34,    34,    34,    41,    33,    35,    52,    54,
      55,    56,    28,    58,    47,    48,    59,    41,     6,     8,
       9,    10,    11,    28,    36,    41,    60,    61,    62,    63,
      66,    69,    32,    67,    32,    32,     3,     4,    13,    14,
      26,    32,    40,    41,    72,    73,    74,    75,    76,    77,
      78,    80,    89,    59,    41,    17,    27,    30,    72,    32,
      72,    41,    72,    27,    30,    79,    24,    25,    57,    84,
      18,    19,    85,    20,    21,    22,    23,    86,    13,    14,
      87,    15,    16,    88,    77,    29,    17,    72,    41,    72,
      33,    72,    33,    33,    33,    41,    72,    32,    34,    73,
      74,    75,    76,    77,    72,    34,    17,    31,    64,    68,
      34,    34,    31,    72,    81,    82,    29,    70,    72,    17,
      60,    33,    83,    33,    37,    34,    72,    65,    60,    35,
      72,    34,     7,    82,    71,    60,    38,    60
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_int8 yyr1[] =
{
       0,    42,    44,    43,    45,    45,    46,    46,    47,    47,
      47,    48,    48,    49,    49,    51,    52,    50,    53,    53,
      54,    54,    56,    57,    55,    58,    58,    59,    59,    60,
      60,    60,    60,    60,    60,    61,    61,    61,    62,    62,
      64,    65,    63,    67,    68,    66,    70,    71,    69,    72,
      72,    73,    73,    74,    74,    75,    75,    76,    76,    77,
      77,    78,    78,    78,    78,    78,    79,    78,    80,    80,
      80,    81,    81,    82,    83,    82,    84,    84,    85,    85,
      86,    86,    86,    86,    87,    87,    88,    88,    89,    89,
      89
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     0,     2,     1,     2,     1,     1,     3,     6,
       6,     1,     1,     3,     4,     0,     0,     8,     0,     1,
       2,     4,     0,     0,     9,     0,     2,     0,     2,     3,
       1,     1,     1,     1,     1,     4,     7,     6,     5,     5,
       0,     0,     9,     0,     0,     7,     0,     0,    10,     1,
       3,     1,     3,     1,     3,     1,     3,     1,     3,     1,
       2,     1,     3,     1,     3,     4,     0,     5,     1,     1,
       1,     0,     1,     1,     0,     4,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YYUSE (yyoutput);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyo, yytoknum[yytype], *yyvaluep);
# endif
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyo, yytype, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[+yyssp[yyi + 1 - yynrhs]],
                       &yyvsp[(yyi + 1) - (yynrhs)]
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen(S) (YY_CAST (YYPTRDIFF_T, strlen (S)))
#  else
/* Return the length of YYSTR.  */
static YYPTRDIFF_T
yystrlen (const char *yystr)
{
  YYPTRDIFF_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYPTRDIFF_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYPTRDIFF_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            else
              goto append;

          append:
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (yyres)
    return yystpcpy (yyres, yystr) - yyres;
  else
    return yystrlen (yystr);
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYPTRDIFF_T *yymsg_alloc, char **yymsg,
                yy_state_t *yyssp, int yytoken)
{
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat: reported tokens (one for the "unexpected",
     one per "expected"). */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Actual size of YYARG. */
  int yycount = 0;
  /* Cumulated lengths of YYARG.  */
  YYPTRDIFF_T yysize = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[+*yyssp];
      YYPTRDIFF_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
      yysize = yysize0;
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYPTRDIFF_T yysize1
                    = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM)
                    yysize = yysize1;
                  else
                    return 2;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
    default: /* Avoid compiler warnings. */
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    /* Don't count the "%s"s in the final size, but reserve room for
       the terminator.  */
    YYPTRDIFF_T yysize1 = yysize + (yystrlen (yyformat) - 2 * yycount) + 1;
    if (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM)
      yysize = yysize1;
    else
      return 2;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          ++yyp;
          ++yyformat;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss;
    yy_state_t *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYPTRDIFF_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYPTRDIFF_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    goto yyexhaustedlab;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
# undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2:
#line 59 "src/asin.y"
        {
                niv = 0;
                dvar = 0;
                si = 0;
                cargaContexto(niv);
                /****Variables globales****/
                (yyval.auxprog).arg1 = creaLans(si);
                emite(INCTOP,crArgNul(),crArgNul(),crArgEnt(-1)); /*variables globales, pero no sabemos aun cuantas tenemos*/
                /****Salto a main******/
                (yyval.auxprog).arg2 = creaLans(si);
                emite(GOTOS,crArgNul(),crArgNul(),crArgEtq(-1)); /*hay que saltar al main,si lo tiene*/
        }
#line 1505 "asin.c"
    break;

  case 3:
#line 70 "src/asin.y"
                             {
                SIMB main = obtTdS("main"); /*sacamos la funcion main*/
                if ((yyvsp[0].cent) == 0) { 
                    yyerror("El programa no tiene main");
                } else if ((yyvsp[0].cent) > 1) { 
                    yyerror("El programa tiene mas de un main");
                }
                /****Completar variables globales**/
                completaLans((yyvsp[-1].auxprog).arg1, crArgEnt(dvar));
                /*saltamos al main*/
                completaLans((yyvsp[-1].auxprog).arg2, crArgEtq(main.d));
        }
#line 1522 "asin.c"
    break;

  case 4:
#line 85 "src/asin.y"
        {
                (yyval.cent) = (yyvsp[0].cent);
        }
#line 1530 "asin.c"
    break;

  case 5:
#line 89 "src/asin.y"
        {
                (yyval.cent) = (yyvsp[-1].cent) + (yyvsp[0].cent);
        }
#line 1538 "asin.c"
    break;

  case 6:
#line 95 "src/asin.y"
        {
                (yyval.cent) = 0;
        }
#line 1546 "asin.c"
    break;

  case 7:
#line 99 "src/asin.y"
        {
                (yyval.cent) = (yyvsp[0].cent);
        }
#line 1554 "asin.c"
    break;

  case 8:
#line 106 "src/asin.y"
        {
                if (!insTdS((yyvsp[-1].ident), VARIABLE, (yyvsp[-2].cent), niv, dvar, -1)) {
                        yyerror("Identificador variable repetido");
                }
                else {
                        dvar += TALLA_TIPO_SIMPLE;
                }
        }
#line 1567 "asin.c"
    break;

  case 9:
#line 115 "src/asin.y"
        {
                int numelem = (yyvsp[-2].cent); /*Array length */
                if (numelem <= 0) {
                        yyerror("Talla inapropiada del array");
                        numelem = 0;
                }
                int refe = insTdA((yyvsp[-5].cent), numelem); /*Referencia en tabla de arrays*/
                /*Insertar en tabla de simbolos e incrementar desplazamiento relativo  */
                if (!insTdS((yyvsp[-4].ident), VARIABLE, T_ARRAY, niv, dvar, refe)) { 
                        yyerror("Identificador repetido");
                } else {
                        dvar += numelem * TALLA_TIPO_SIMPLE;
                } 
        }
#line 1586 "asin.c"
    break;

  case 10:
#line 130 "src/asin.y"
        {
                if (!insTdS((yyvsp[-1].ident), VARIABLE, T_RECORD, niv, dvar, (yyvsp[-3].CampoRegistro).refe)) {
                        yyerror("Identificador repetido");
                } else {
                        dvar += (yyvsp[-3].CampoRegistro).desp_r;
                }
        }
#line 1598 "asin.c"
    break;

  case 11:
#line 140 "src/asin.y"
        {
                (yyval.cent) = T_ENTERO;
        }
#line 1606 "asin.c"
    break;

  case 12:
#line 144 "src/asin.y"
        {
                (yyval.cent) = T_LOGICO;
        }
#line 1614 "asin.c"
    break;

  case 13:
#line 151 "src/asin.y"
        {
                /* NO PUEDE DAR ERROR, NO HACE FALTA COMPROBAR NADA */
                (yyval.CampoRegistro).refe = insTdR(-1, (yyvsp[-1].ident), (yyvsp[-2].cent), 0);/* creamos campo de registro */
                (yyval.CampoRegistro).desp_r = TALLA_TIPO_SIMPLE; /* incrementar desplazamiento */
        }
#line 1624 "asin.c"
    break;

  case 14:
#line 157 "src/asin.y"
        {
                (yyval.CampoRegistro).refe = (yyvsp[-3].CampoRegistro).refe; /* pillamos valor antes */
                (yyval.CampoRegistro).desp_r = (yyvsp[-3].CampoRegistro).desp_r; /*desplazamiento (AKA talla diapositivas)*/
                if (insTdR((yyvsp[-3].CampoRegistro).refe,(yyvsp[-1].ident), (yyvsp[-2].cent), (yyvsp[-3].CampoRegistro).desp_r) == -1)
                        yyerror("Campo ya existente en el registro");
                else {
                        (yyval.CampoRegistro).refe = (yyvsp[-3].CampoRegistro).refe;
                        (yyval.CampoRegistro).desp_r = (yyvsp[-3].CampoRegistro).desp_r + TALLA_TIPO_SIMPLE; /*incrementamos desplazamiento puesto que hay un campo nuevo*/
                }   
        }
#line 1639 "asin.c"
    break;

  case 15:
#line 170 "src/asin.y"
        {
                (yyval.cent) = dvar;
                dvar = 0;
                niv++;
                cargaContexto(niv);
        }
#line 1650 "asin.c"
    break;

  case 16:
#line 177 "src/asin.y"
        {
                if (!insTdS((yyvsp[-4].ident), FUNCION, (yyvsp[-5].cent), niv - 1, si, (yyvsp[-1].cent))) {
                        yyerror("Identificador de función repetido");
                } 
                if (strcmp((yyvsp[-4].ident), "main") == 0) { 
                        (yyval.cent) = 1;
                } else { 
                        (yyval.cent) = 0;
                } 
        }
#line 1665 "asin.c"
    break;

  case 17:
#line 187 "src/asin.y"
        {
                if (verTdS) { 
                        mostrarTdS();
                } 
                descargaContexto(niv);
                niv--;
                dvar = (yyvsp[-5].cent);
                (yyval.cent) =  (yyvsp[-1].cent);  
        }
#line 1679 "asin.c"
    break;

  case 18:
#line 199 "src/asin.y"
        {
                (yyval.cent) = insTdD(-1, T_VACIO);
        }
#line 1687 "asin.c"
    break;

  case 19:
#line 203 "src/asin.y"
        {
                (yyval.cent) = (yyvsp[0].ParamForm).refe;
        }
#line 1695 "asin.c"
    break;

  case 20:
#line 209 "src/asin.y"
        {
                (yyval.ParamForm).refe = insTdD(-1, (yyvsp[-1].cent));
                (yyval.ParamForm).talla = TALLA_TIPO_SIMPLE + TALLA_SEGENLACES;
                if (!insTdS((yyvsp[0].ident), PARAMETRO, (yyvsp[-1].cent), niv, -(yyval.ParamForm).talla, -1)) { 
                        yyerror("Identificador del parámetro repetido");
                } 
        }
#line 1707 "asin.c"
    break;

  case 21:
#line 217 "src/asin.y"
        {
                (yyval.ParamForm).talla = (yyvsp[0].ParamForm).talla; /*Nueva parametro, incrementamos talla*/
                (yyval.ParamForm).refe = insTdD((yyvsp[0].ParamForm).refe, (yyvsp[-3].cent)); /* nos quedamos con la referencia del nuevo parametro*/
                if (!insTdS((yyvsp[-2].ident), PARAMETRO, (yyvsp[-3].cent), niv, -((yyval.ParamForm).talla + TALLA_TIPO_SIMPLE), -1)) { 
                        yyerror("Identificador del parametro repetido");
                } else { 
                        (yyval.ParamForm).talla += TALLA_TIPO_SIMPLE;
                } 
        }
#line 1721 "asin.c"
    break;

  case 22:
#line 228 "src/asin.y"
         {
                emite(PUSHFP,crArgNul(),crArgNul(),crArgNul()); /* apilamos fp en la pila */
                emite(FPTOP,crArgNul(),crArgNul(),crArgNul()); /* movemos fp arriba del todo de la pila */
                /*variables locales y temporales*/
                (yyval.cent) = creaLans(si); /*cuantas variables temporales y vocales hay */
                emite(INCTOP,crArgNul(),crArgNul(),crArgEnt(-1));
        }
#line 1733 "asin.c"
    break;

  case 23:
#line 235 "src/asin.y"
        {
                INF func = obtTdD(-1);
                /* espacio para las variables reservado OK */
                completaLans((yyvsp[-5].cent),crArgEnt(dvar));
                /* valor retorno,mirar el tema 5, basicamente es la funcion que hay en la diapo 5*/
                int accvalret = TALLA_SEGENLACES + func.tsp + TALLA_TIPO_SIMPLE;
                emite(EASIG,crArgPos(niv, (yyvsp[0].exp).desp),crArgNul(),crArgPos(niv,-accvalret));
                /*liberar segmento de variables locales y temporales */
                emite(TOPFP, crArgNul(),crArgNul(),crArgNul()); /*desapilamos variables temporales y locales*/
                /*desapilar enlaces de control*/
                emite(FPPOP,crArgNul(),crArgNul(),crArgNul());

                if(func.tipo == T_ERROR) {
                        yyerror("Error en declaracion de funcion");
                }else if((yyvsp[0].exp).tipo != T_ERROR && func.tipo != (yyvsp[0].exp).tipo){
                        yyerror("Error de tipos del \"return\"");
                } 
                        
                if(strcmp(func.nom,"main") == 0){
                        emite(FIN,crArgNul(),crArgNul(),crArgNul()); /* fin del programa */
                }     
                else{
                        emite(RET,crArgNul(),crArgNul(),crArgNul()); /*return de una funcion */
                } 
                    
        }
#line 1764 "asin.c"
    break;

  case 35:
#line 281 "src/asin.y"
        {
                SIMB simb = obtTdS((yyvsp[-3].ident));
                if ((yyvsp[-1].exp).tipo != T_ERROR) {
                        if (simb.t == T_ERROR) {
                                yyerror("Objeto no declarado");
                        } else if (simb.t != (yyvsp[-1].exp).tipo && (yyvsp[-1].exp).tipo != T_ERROR) {
                                yyerror("Error de tipos en la asignación");
                        } 
                } 
                emite(EASIG,crArgPos(niv,(yyvsp[-1].exp).desp),crArgNul(),crArgPos(simb.n,simb.d)); /*asignacion */
        }
#line 1780 "asin.c"
    break;

  case 36:
#line 293 "src/asin.y"
        {
                /* Sacamos simbolo e informacion del array dado el simbolo*/
                SIMB simb = obtTdS((yyvsp[-6].ident));
                if ((yyvsp[-4].exp).tipo != T_ERROR && (yyvsp[-1].exp).tipo != T_ERROR) {
                        if (simb.t == T_ERROR) {
                                yyerror("Objeto no declarado");
                        } else if (simb.t != T_ARRAY) { /* Tenemos que tratar con un array */
                                yyerror("El identificador debe ser de tipo \"array\"");
                        } else {
                                DIM dim = obtTdA(simb.ref);
                                if ((yyvsp[-4].exp).tipo != T_ENTERO) { /* Se accede a los indicies con enteros */
                                        yyerror("El índice del array debe ser entero");
                                } else if ((yyvsp[-1].exp).tipo != dim.telem) { /* La asignacion no coincide con el tipo del array */
                                        yyerror("Error de tipos en la asignación");
                                } 
                        }
                }
                emite(EVA,crArgPos(simb.n,simb.d),crArgPos(niv,(yyvsp[-4].exp).desp),crArgPos(niv,(yyvsp[-1].exp).desp));
        }
#line 1804 "asin.c"
    break;

  case 37:
#line 313 "src/asin.y"
        {
                SIMB simb = obtTdS((yyvsp[-5].ident));
                CAMP camp = obtTdR(simb.ref, (yyvsp[-3].ident));
                if ((yyvsp[-1].exp).tipo != T_ERROR) {
                        if (simb.t == T_ERROR)
                                yyerror("Objeto no declarado");
                        else if (simb.t != T_RECORD)
                                yyerror("El identificador debe ser de tipo struct");
                        else {
                                if (camp.t != (yyvsp[-1].exp).tipo) { 
                                        yyerror("Error de tipos en la asignación");
                                }
                        }
                        int d = simb.d + camp.d; /*sumamos desplazamientos*/
                        emite(EASIG,crArgPos(niv,(yyvsp[-1].exp).desp),crArgNul(),crArgPos(simb.n,d));
                }
        }
#line 1826 "asin.c"
    break;

  case 38:
#line 333 "src/asin.y"
        { 
                SIMB simb = obtTdS((yyvsp[-2].ident));
                if (simb.t == T_ERROR) {
                        yyerror("Objeto no declarado");
                } else if (simb.t != T_ENTERO) {
                        yyerror("El argumento de read debe ser entero");
                }
                emite(EREAD, crArgNul(), crArgNul(),crArgPos(simb.n , simb.d));
        }
#line 1840 "asin.c"
    break;

  case 39:
#line 343 "src/asin.y"
        {
                if ((yyvsp[-2].exp).tipo != T_ENTERO) {
                        yyerror("La expresión de print debe ser entera");
                }
                emite(EWRITE, crArgNul(), crArgNul(), crArgPos(niv, (yyvsp[-2].exp).desp));
        }
#line 1851 "asin.c"
    break;

  case 40:
#line 353 "src/asin.y"
                                    {
                if((yyvsp[-1].exp).tipo != T_LOGICO && (yyvsp[-1].exp).tipo != T_ERROR)
                        yyerror("La expresion del \"if\" debe ser \"logico\"");
                (yyval.cent) = creaLans(si); /*creamos la LANS*/
                emite(EIGUAL,crArgPos(niv,(yyvsp[-1].exp).desp),crArgEnt(0), crArgEtq(-1)); /*-1 para rellenar */
        }
#line 1862 "asin.c"
    break;

  case 41:
#line 358 "src/asin.y"
                      {
                (yyval.cent) = creaLans(si);
                emite(GOTOS,crArgNul(),crArgNul(),crArgEtq(-1)); /*-1 para rellenar*/
                completaLans((yyvsp[-1].cent), crArgEtq(si)); /*saltamos en caso de ELSE */
        }
#line 1872 "asin.c"
    break;

  case 42:
#line 362 "src/asin.y"
                            {
                completaLans((yyvsp[-2].cent), crArgEtq(si));
        }
#line 1880 "asin.c"
    break;

  case 43:
#line 370 "src/asin.y"
                 { (yyval.cent) = si; /*direccion de expresion*/ }
#line 1886 "asin.c"
    break;

  case 44:
#line 371 "src/asin.y"
        {
                if((yyvsp[0].exp).tipo != T_LOGICO && (yyvsp[0].exp).tipo != T_ERROR){
                        yyerror("La expresion del \"while\" debe ser \"logico\"");
                } 
                (yyval.cent) = creaLans(si); /*nos guardamos la dir. del emite */
                emite(EIGUAL,crArgPos(niv,(yyvsp[0].exp).desp),crArgEnt(0),crArgEtq(-1)); /*-1 para rellenar*/
        }
#line 1898 "asin.c"
    break;

  case 45:
#line 377 "src/asin.y"
                            {
                emite(GOTOS,crArgNul(),crArgNul(),crArgEtq((yyvsp[-5].cent))); /*saltamos al inicio del bucle */
                completaLans((yyvsp[-2].cent),crArgEtq(si));/*completa la lista, tiene que saltar fuera */
        }
#line 1907 "asin.c"
    break;

  case 46:
#line 386 "src/asin.y"
                                    {
                SIMB simb = obtTdS((yyvsp[-2].ident)); /* Utilizamos simb para obtener las variables */
                if ((yyvsp[0].exp).tipo != T_ERROR) {
                        if (simb.t == T_ERROR) {
                                yyerror("Objeto no declarado");
                        } else if (simb.t != (yyvsp[0].exp).tipo && (yyvsp[0].exp).tipo != T_ERROR) {
                                yyerror("Error de tipos en la asignación");
                        } 
                } 
                emite(EASIG, crArgPos(niv, (yyvsp[0].exp).desp), crArgNul(), crArgPos(simb.n, simb.d)); /* asignar expresion al ID */
                (yyval.cent) = si;
        }
#line 1924 "asin.c"
    break;

  case 47:
#line 397 "src/asin.y"
                        {
                SIMB simb = obtTdS((yyvsp[-5].ident));
                (yyval.cent) = creaLans(si);    
                emite(EMAYEQ, crArgPos(niv, (yyvsp[0].exp).desp), crArgPos(simb.n, simb.d), crArgEtq(-1));
        }
#line 1934 "asin.c"
    break;

  case 48:
#line 401 "src/asin.y"
                          {
                SIMB simb = obtTdS((yyvsp[-8].ident));
                emite(ESUM, crArgPos(simb.n, simb.d), crArgEnt(1), crArgPos(simb.n, simb.d)); /* incrementamos el ID */
                emite(GOTOS, crArgNul(), crArgNul(), crArgEtq((yyvsp[-5].cent))); /* saltamos al inicio del bucle */
                completaLans((yyvsp[-2].cent), crArgEtq(si)); /* completa la lista, tiene que saltar fuera */
        }
#line 1945 "asin.c"
    break;

  case 49:
#line 412 "src/asin.y"
        {
               (yyval.exp).tipo = (yyvsp[0].exp).tipo; 
               (yyval.exp).desp = (yyvsp[0].exp).desp;
        }
#line 1954 "asin.c"
    break;

  case 50:
#line 417 "src/asin.y"
        {
                if ((yyvsp[-2].exp).tipo == T_ERROR || (yyvsp[0].exp).tipo == T_ERROR) 
                   (yyval.exp).tipo = T_ERROR;
                else if(!((yyvsp[-2].exp).tipo == T_LOGICO && (yyvsp[-2].exp).tipo == (yyvsp[0].exp).tipo)) {
                    (yyval.exp).tipo = T_ERROR;
                    yyerror("Error en \"expresion logica\"");
                }
                else
                    (yyval.exp).tipo = T_LOGICO;
                
                (yyval.exp).desp = creaVarTemp();
                emite((yyvsp[-1].cent), crArgPos(niv, (yyvsp[-2].exp).desp), crArgPos(niv, (yyvsp[0].exp).desp), crArgPos(niv, (yyval.exp).desp));
                if((yyvsp[-1].cent) == ESUM) {
                    /* si: if $$ <= 1 then goto si + 2 (diapositivas) */
                    emite(EMENEQ, crArgPos(niv, (yyval.exp).desp), crArgEnt(1), crArgEtq(si + 2));
                    /*asignacion por si la suma da mayor que uno */
                    emite(EASIG, crArgEnt(1), crArgNul(), crArgPos(niv, (yyval.exp).desp));
                }
        }
#line 1978 "asin.c"
    break;

  case 51:
#line 441 "src/asin.y"
        {
                (yyval.exp) = (yyvsp[0].exp);
        }
#line 1986 "asin.c"
    break;

  case 52:
#line 445 "src/asin.y"
        {
                if((yyvsp[-2].exp).tipo == T_ERROR || (yyvsp[0].exp).tipo == T_ERROR)
                        (yyval.exp).tipo = T_ERROR;
                else if(!(((yyvsp[-2].exp).tipo == T_LOGICO && (yyvsp[-2].exp).tipo == (yyvsp[0].exp).tipo) || ((yyvsp[-2].exp).tipo == T_ENTERO && (yyvsp[-2].exp).tipo == (yyvsp[0].exp).tipo) )) {
                        (yyval.exp).tipo = T_ERROR;
                        yyerror("Error en \"expresion de igualdad\"");
                } else {
                        (yyval.exp).tipo = T_LOGICO;
                }
                (yyval.exp).desp = creaVarTemp();
                emite(EASIG,crArgEnt(1),crArgNul(), crArgPos(niv, (yyval.exp).desp));
                emite((yyvsp[-1].cent), crArgPos(niv, (yyvsp[-2].exp).desp), crArgPos(niv, (yyvsp[0].exp).desp), crArgEtq(si + 2));
                emite(EASIG,crArgEnt(0),crArgNul(), crArgPos(niv, (yyval.exp).desp));
        }
#line 2005 "asin.c"
    break;

  case 53:
#line 462 "src/asin.y"
        {
                (yyval.exp) = (yyvsp[0].exp);
        }
#line 2013 "asin.c"
    break;

  case 54:
#line 466 "src/asin.y"
        {
                if ((yyvsp[-2].exp).tipo == T_ERROR || (yyvsp[0].exp).tipo == T_ERROR)
                        (yyval.exp).tipo = T_ERROR;
                else if ((yyvsp[-2].exp).tipo != T_ENTERO || (yyvsp[0].exp).tipo != T_ENTERO) {
                        (yyval.exp).tipo = T_ERROR;
                        yyerror("Error en expresión relacional");
                } else {
                        (yyval.exp).tipo = T_LOGICO;
                }
                (yyval.exp).desp = creaVarTemp();
                /*asumimos true, si se cumple saltamos, si no se cumple es false y por tanto 0 */
                emite(EASIG,crArgEnt(1),crArgNul(), crArgPos(niv, (yyval.exp).desp));
                emite((yyvsp[-1].cent), crArgPos(niv, (yyvsp[-2].exp).desp), crArgPos(niv, (yyvsp[0].exp).desp), crArgEtq(si + 2));
                emite(EASIG,crArgEnt(0),crArgNul(), crArgPos(niv, (yyval.exp).desp));
        }
#line 2033 "asin.c"
    break;

  case 55:
#line 484 "src/asin.y"
        {
                (yyval.exp) = (yyvsp[0].exp);
        }
#line 2041 "asin.c"
    break;

  case 56:
#line 488 "src/asin.y"
        {
                if ((yyvsp[-2].exp).tipo == T_ERROR || (yyvsp[0].exp).tipo == T_ERROR)
                        (yyval.exp).tipo = T_ERROR;
                else if ((yyvsp[-2].exp).tipo != T_ENTERO || (yyvsp[0].exp).tipo != T_ENTERO) {
                        (yyval.exp).tipo = T_ERROR;
                        yyerror("Error en expresión aditiva");
                } else {
                        (yyval.exp).tipo = T_ENTERO;
                }
                (yyval.exp).desp = creaVarTemp();
                emite((yyvsp[-1].cent), crArgPos(niv, (yyvsp[-2].exp).desp),crArgPos(niv, (yyvsp[0].exp).desp), crArgPos(niv, (yyval.exp).desp));
        }
#line 2058 "asin.c"
    break;

  case 57:
#line 504 "src/asin.y"
        {
                (yyval.exp) = (yyvsp[0].exp);
        }
#line 2066 "asin.c"
    break;

  case 58:
#line 508 "src/asin.y"
        {
                if((yyvsp[-2].exp).tipo == T_ERROR || (yyvsp[0].exp).tipo == T_ERROR){
                        (yyval.exp).tipo = T_ERROR;
                } 
                else if((yyvsp[-2].exp).tipo != T_ENTERO || (yyvsp[0].exp).tipo != T_ENTERO) {
                        (yyval.exp).tipo = T_ERROR;
                        yyerror("Error en \"expresion multiplicativa\"");
                }
                else {
                        (yyval.exp).tipo = T_ENTERO;
                }
                (yyval.exp).desp = creaVarTemp();
                emite((yyvsp[-1].cent), crArgPos(niv, (yyvsp[-2].exp).desp), crArgPos(niv, (yyvsp[0].exp).desp), crArgPos(niv, (yyval.exp).desp));
        }
#line 2085 "asin.c"
    break;

  case 59:
#line 524 "src/asin.y"
        {
                (yyval.exp) = (yyvsp[0].exp);
        }
#line 2093 "asin.c"
    break;

  case 60:
#line 528 "src/asin.y"
        {
                if((yyvsp[0].exp).tipo == T_ERROR){
                        (yyval.exp).tipo = (yyvsp[0].exp).tipo;
                } 
                
                // Revisar este tratamiento del error
                else if( ( ((yyvsp[-1].cent) == EASIG || (yyvsp[-1].cent) == ESIG) && (yyvsp[0].exp).tipo != T_ENTERO) || ((yyvsp[-1].cent) == EDIF && (yyvsp[0].exp).tipo!=T_LOGICO) )
                {
                        yyerror("Error en expresion unaria ");
                        (yyval.exp).tipo = T_ERROR;
                }else {
                        (yyval.exp).tipo = (yyvsp[0].exp).tipo;
                }
                (yyval.exp).desp = creaVarTemp();
                switch((yyvsp[-1].cent)){
                        case EASIG:
                                // Se mantiene igual
                                emite((yyvsp[-1].cent), crArgPos(niv, (yyvsp[0].exp).desp), crArgNul(), crArgPos(niv, (yyval.exp).desp));
                                break;

                        case ESIG:
                                // Cambio de signo MENOS
                                emite((yyvsp[-1].cent), crArgPos(niv, (yyvsp[0].exp).desp), crArgNul(), crArgPos(niv, (yyval.exp).desp));
                                break;

                        case EDIF:
                                // Negación logica x=1-x
                                emite((yyvsp[-1].cent), crArgEnt(1), crArgPos(niv, (yyvsp[0].exp).desp), crArgPos(niv, (yyval.exp).desp));
                                break;
                }
        }
#line 2129 "asin.c"
    break;

  case 61:
#line 563 "src/asin.y"
                { 
                        (yyval.exp) = (yyvsp[0].exp);       
                }
#line 2137 "asin.c"
    break;

  case 62:
#line 567 "src/asin.y"
                {
                        (yyval.exp) = (yyvsp[-1].exp);              
                }
#line 2145 "asin.c"
    break;

  case 63:
#line 571 "src/asin.y"
                {
                        SIMB simb = obtTdS((yyvsp[0].ident));
                        (yyval.exp).tipo = T_ERROR;
                        if (simb.t == T_ERROR) {
                                yyerror("Objeto no declarado");
                        }  else {
                                (yyval.exp).tipo = simb.t;
                        } 
                        (yyval.exp).desp = creaVarTemp();
                        emite(EASIG, crArgPos(simb.n, simb.d), crArgNul(), crArgPos(niv, (yyval.exp).desp));
                }
#line 2161 "asin.c"
    break;

  case 64:
#line 583 "src/asin.y"
                {
                        SIMB simb = obtTdS((yyvsp[-2].ident));
                        CAMP camp = obtTdR(simb.ref, (yyvsp[0].ident));
                        (yyval.exp).tipo = T_ERROR;
                        if (simb.t == T_ERROR) {
                                yyerror("Objeto no declarado");
                        } else if (simb.t != T_RECORD) {
                                yyerror("El identificador no es una estructura");
                        }  else {
                                if (camp.t == T_ERROR) { /*¿El campo está declarado?*/
                                        yyerror("Campo no declarado");
                                        (yyval.exp).tipo = T_ERROR;
                                } else
                                        (yyval.exp).tipo = camp.t;
                        }
                        int d = simb.d + camp.d;
                        (yyval.exp).desp = creaVarTemp();
                        emite(EASIG,crArgPos(simb.n,d), crArgNul(), crArgPos(niv, (yyval.exp).desp));
                }
#line 2185 "asin.c"
    break;

  case 65:
#line 603 "src/asin.y"
                {
                        SIMB simb = obtTdS((yyvsp[-3].ident));
                        DIM dim = obtTdA(simb.ref);
                        (yyval.exp).tipo = T_ERROR;
                        if (simb.t == T_ERROR) {
                                yyerror("Objeto no declarado");
                        } else if (simb.t != T_ARRAY) {
                                yyerror("Variable no es un array");
                        } else if ((yyvsp[-1].exp).tipo != T_ENTERO) { /* Indice entero */
                                yyerror("El indice del \"array\" debe ser entero");
                        } else {
                                (yyval.exp).tipo = dim.telem;
                        }
                        (yyval.exp).desp = creaVarTemp(); 
                        emite(EAV, crArgPos(simb.n,simb.d), crArgPos(niv, (yyvsp[-1].exp).desp), crArgPos(niv, (yyval.exp).desp));  
                }
#line 2206 "asin.c"
    break;

  case 66:
#line 619 "src/asin.y"
             { 
                emite(EPUSH,crArgNul(),crArgNul(),crArgEnt(0));
          }
#line 2214 "asin.c"
    break;

  case 67:
#line 622 "src/asin.y"
                {
                        SIMB simb = obtTdS((yyvsp[-4].ident));
                        INF inf = obtTdD(simb.ref);
                        (yyval.exp).tipo = T_ERROR;
                        if (simb.t == T_ERROR) {
                                yyerror("Objeto no declarado");
                        } else if (inf.tipo == T_ERROR) {
                                yyerror("El identificador no es una función");
                        } else {
                                if (cmpDom(simb.ref, (yyvsp[-1].cent)) == 0) {
                                        yyerror("El dominio de los parámetros no coincide con el de la función");
                                } else {
                                        (yyval.exp).tipo = inf.tipo;
                                }
                        }
                        (yyval.exp).desp = creaVarTemp();
                        /**llamada a la funcion**/
                        emite(CALL, crArgNul(), crArgNul(), crArgEtq(simb.d));
                        /** desapilar segmento de parametros**/
                        emite(DECTOP,crArgNul(),crArgNul(),crArgEnt(inf.tsp));
                        /**desapilar y asignar valor de retorno*/
                        emite(EPOP,crArgNul(),crArgNul(),crArgPos(niv, (yyval.exp).desp));   
                }
#line 2242 "asin.c"
    break;

  case 68:
#line 647 "src/asin.y"
                      { (yyval.exp).tipo = T_ENTERO; 
                        (yyval.exp).desp=creaVarTemp();
                        emite(EASIG,crArgEnt((yyvsp[0].cent)),crArgNul(),crArgPos(niv,(yyval.exp).desp)); }
#line 2250 "asin.c"
    break;

  case 69:
#line 650 "src/asin.y"
                        { (yyval.exp).tipo = T_LOGICO;
                          (yyval.exp).desp=creaVarTemp();
                          emite(EASIG,crArgEnt(1),crArgNul(),crArgPos(niv,(yyval.exp).desp));}
#line 2258 "asin.c"
    break;

  case 70:
#line 653 "src/asin.y"
                        { (yyval.exp).tipo = T_LOGICO;
                          (yyval.exp).desp=creaVarTemp();
                          emite(EASIG,crArgEnt(0),crArgNul(),crArgPos(niv,(yyval.exp).desp));}
#line 2266 "asin.c"
    break;

  case 71:
#line 660 "src/asin.y"
                {       
                        (yyval.cent) = insTdD(-1, T_VACIO);
                }
#line 2274 "asin.c"
    break;

  case 72:
#line 664 "src/asin.y"
                {       
                        (yyval.cent) = (yyvsp[0].cent);
                }
#line 2282 "asin.c"
    break;

  case 73:
#line 671 "src/asin.y"
                {   
                        (yyval.cent) = insTdD(-1, (yyvsp[0].exp).tipo); 
                        emite(EPUSH,crArgNul(),crArgNul(),crArgPos(niv,(yyvsp[0].exp).desp));
                }
#line 2291 "asin.c"
    break;

  case 74:
#line 675 "src/asin.y"
                    {
                emite(EPUSH,crArgNul(),crArgNul(),crArgPos(niv,(yyvsp[0].exp).desp));
                }
#line 2299 "asin.c"
    break;

  case 75:
#line 678 "src/asin.y"
                {       
                        (yyval.cent) = insTdD((yyvsp[0].cent), (yyvsp[-3].exp).tipo);
                }
#line 2307 "asin.c"
    break;

  case 76:
#line 684 "src/asin.y"
                 { (yyval.cent) = EMULT; }
#line 2313 "asin.c"
    break;

  case 77:
#line 685 "src/asin.y"
                 { (yyval.cent) = ESUM; }
#line 2319 "asin.c"
    break;

  case 78:
#line 688 "src/asin.y"
                    { (yyval.cent) = EIGUAL; }
#line 2325 "asin.c"
    break;

  case 79:
#line 689 "src/asin.y"
                    { (yyval.cent) = EDIST; }
#line 2331 "asin.c"
    break;

  case 80:
#line 692 "src/asin.y"
                   { (yyval.cent) = EMAY; }
#line 2337 "asin.c"
    break;

  case 81:
#line 693 "src/asin.y"
                   { (yyval.cent) = EMEN; }
#line 2343 "asin.c"
    break;

  case 82:
#line 694 "src/asin.y"
                        { (yyval.cent) = EMAYEQ; }
#line 2349 "asin.c"
    break;

  case 83:
#line 695 "src/asin.y"
                        { (yyval.cent) = EMENEQ; }
#line 2355 "asin.c"
    break;

  case 84:
#line 698 "src/asin.y"
                {(yyval.cent) = ESUM;}
#line 2361 "asin.c"
    break;

  case 85:
#line 699 "src/asin.y"
                 {(yyval.cent) = EDIF;}
#line 2367 "asin.c"
    break;

  case 86:
#line 702 "src/asin.y"
                 { (yyval.cent) = EMULT; }
#line 2373 "asin.c"
    break;

  case 87:
#line 703 "src/asin.y"
                 { (yyval.cent) = EDIVI; }
#line 2379 "asin.c"
    break;

  case 88:
#line 706 "src/asin.y"
                 { (yyval.cent) = EASIG;      }
#line 2385 "asin.c"
    break;

  case 89:
#line 707 "src/asin.y"
                 { (yyval.cent) = ESIG;    }
#line 2391 "asin.c"
    break;

  case 90:
#line 708 "src/asin.y"
                 { (yyval.cent) = EDIF;      }
#line 2397 "asin.c"
    break;


#line 2401 "asin.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = YY_CAST (char *, YYSTACK_ALLOC (YY_CAST (YYSIZE_T, yymsg_alloc)));
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;


#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif


/*-----------------------------------------------------.
| yyreturn -- parsing is finished, return the result.  |
`-----------------------------------------------------*/
yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[+*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 710 "src/asin.y"
