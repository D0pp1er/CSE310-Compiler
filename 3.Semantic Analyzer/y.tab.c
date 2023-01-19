/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
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
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 1 "1905028.y"

#include<bits/stdc++.h>

#include "1905028_SymbolInfo.h"
#include "1905028_ScopeTable.h"
#include "1905028_SymbolTable.h"
// #define YYSTYPE SymbolInfo*

using namespace std;

int yyparse(void);
int yylex(void);
extern FILE *yyin;
extern int yylineno;

int error_count;

ofstream logout("1905028_log_smaple.txt");
ofstream errorout("1905028_error.txt");


// ofstream parserout("1905028_parsetree.txt");
Symbol_Table symbol_table(11);



void yyerror(char *s)
{
	//write your code
    printf("%s\n",s);
}



#line 106 "y.tab.c"

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

/* Use api.header.include to #include this header
   instead of duplicating it here.  */
#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    IF = 258,                      /* IF  */
    ELSE = 259,                    /* ELSE  */
    FOR = 260,                     /* FOR  */
    WHILE = 261,                   /* WHILE  */
    DO = 262,                      /* DO  */
    VOID = 263,                    /* VOID  */
    SWITCH = 264,                  /* SWITCH  */
    CASE = 265,                    /* CASE  */
    DEFAULT = 266,                 /* DEFAULT  */
    BREAK = 267,                   /* BREAK  */
    CONTINUE = 268,                /* CONTINUE  */
    RETURN = 269,                  /* RETURN  */
    MAIN = 270,                    /* MAIN  */
    ADDOP = 271,                   /* ADDOP  */
    INCOP = 272,                   /* INCOP  */
    DECOP = 273,                   /* DECOP  */
    RELOP = 274,                   /* RELOP  */
    LOGICOP = 275,                 /* LOGICOP  */
    ASSIGNOP = 276,                /* ASSIGNOP  */
    NOT = 277,                     /* NOT  */
    MULOP = 278,                   /* MULOP  */
    BITOP = 279,                   /* BITOP  */
    ID = 280,                      /* ID  */
    INT = 281,                     /* INT  */
    FLOAT = 282,                   /* FLOAT  */
    CONST_INT = 283,               /* CONST_INT  */
    CONST_FLOAT = 284,             /* CONST_FLOAT  */
    DOUBLE = 285,                  /* DOUBLE  */
    CONST_CHAR = 286,              /* CONST_CHAR  */
    CHAR = 287,                    /* CHAR  */
    LTHIRD = 288,                  /* LTHIRD  */
    RTHIRD = 289,                  /* RTHIRD  */
    LCURL = 290,                   /* LCURL  */
    RCURL = 291,                   /* RCURL  */
    LPAREN = 292,                  /* LPAREN  */
    RPAREN = 293,                  /* RPAREN  */
    COMMA = 294,                   /* COMMA  */
    SEMICOLON = 295,               /* SEMICOLON  */
    PRINTLN = 296,                 /* PRINTLN  */
    LOWER_THAN_ELSE = 297          /* LOWER_THAN_ELSE  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define IF 258
#define ELSE 259
#define FOR 260
#define WHILE 261
#define DO 262
#define VOID 263
#define SWITCH 264
#define CASE 265
#define DEFAULT 266
#define BREAK 267
#define CONTINUE 268
#define RETURN 269
#define MAIN 270
#define ADDOP 271
#define INCOP 272
#define DECOP 273
#define RELOP 274
#define LOGICOP 275
#define ASSIGNOP 276
#define NOT 277
#define MULOP 278
#define BITOP 279
#define ID 280
#define INT 281
#define FLOAT 282
#define CONST_INT 283
#define CONST_FLOAT 284
#define DOUBLE 285
#define CONST_CHAR 286
#define CHAR 287
#define LTHIRD 288
#define RTHIRD 289
#define LCURL 290
#define RCURL 291
#define LPAREN 292
#define RPAREN 293
#define COMMA 294
#define SEMICOLON 295
#define PRINTLN 296
#define LOWER_THAN_ELSE 297

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 36 "1905028.y"

    TreeNode* treeNode;

#line 247 "y.tab.c"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_IF = 3,                         /* IF  */
  YYSYMBOL_ELSE = 4,                       /* ELSE  */
  YYSYMBOL_FOR = 5,                        /* FOR  */
  YYSYMBOL_WHILE = 6,                      /* WHILE  */
  YYSYMBOL_DO = 7,                         /* DO  */
  YYSYMBOL_VOID = 8,                       /* VOID  */
  YYSYMBOL_SWITCH = 9,                     /* SWITCH  */
  YYSYMBOL_CASE = 10,                      /* CASE  */
  YYSYMBOL_DEFAULT = 11,                   /* DEFAULT  */
  YYSYMBOL_BREAK = 12,                     /* BREAK  */
  YYSYMBOL_CONTINUE = 13,                  /* CONTINUE  */
  YYSYMBOL_RETURN = 14,                    /* RETURN  */
  YYSYMBOL_MAIN = 15,                      /* MAIN  */
  YYSYMBOL_ADDOP = 16,                     /* ADDOP  */
  YYSYMBOL_INCOP = 17,                     /* INCOP  */
  YYSYMBOL_DECOP = 18,                     /* DECOP  */
  YYSYMBOL_RELOP = 19,                     /* RELOP  */
  YYSYMBOL_LOGICOP = 20,                   /* LOGICOP  */
  YYSYMBOL_ASSIGNOP = 21,                  /* ASSIGNOP  */
  YYSYMBOL_NOT = 22,                       /* NOT  */
  YYSYMBOL_MULOP = 23,                     /* MULOP  */
  YYSYMBOL_BITOP = 24,                     /* BITOP  */
  YYSYMBOL_ID = 25,                        /* ID  */
  YYSYMBOL_INT = 26,                       /* INT  */
  YYSYMBOL_FLOAT = 27,                     /* FLOAT  */
  YYSYMBOL_CONST_INT = 28,                 /* CONST_INT  */
  YYSYMBOL_CONST_FLOAT = 29,               /* CONST_FLOAT  */
  YYSYMBOL_DOUBLE = 30,                    /* DOUBLE  */
  YYSYMBOL_CONST_CHAR = 31,                /* CONST_CHAR  */
  YYSYMBOL_CHAR = 32,                      /* CHAR  */
  YYSYMBOL_LTHIRD = 33,                    /* LTHIRD  */
  YYSYMBOL_RTHIRD = 34,                    /* RTHIRD  */
  YYSYMBOL_LCURL = 35,                     /* LCURL  */
  YYSYMBOL_RCURL = 36,                     /* RCURL  */
  YYSYMBOL_LPAREN = 37,                    /* LPAREN  */
  YYSYMBOL_RPAREN = 38,                    /* RPAREN  */
  YYSYMBOL_COMMA = 39,                     /* COMMA  */
  YYSYMBOL_SEMICOLON = 40,                 /* SEMICOLON  */
  YYSYMBOL_PRINTLN = 41,                   /* PRINTLN  */
  YYSYMBOL_LOWER_THAN_ELSE = 42,           /* LOWER_THAN_ELSE  */
  YYSYMBOL_YYACCEPT = 43,                  /* $accept  */
  YYSYMBOL_start = 44,                     /* start  */
  YYSYMBOL_program = 45,                   /* program  */
  YYSYMBOL_unit = 46,                      /* unit  */
  YYSYMBOL_func_declaration = 47,          /* func_declaration  */
  YYSYMBOL_func_definition = 48,           /* func_definition  */
  YYSYMBOL_parameter_list = 49,            /* parameter_list  */
  YYSYMBOL_compound_statement = 50,        /* compound_statement  */
  YYSYMBOL_var_declaration = 51,           /* var_declaration  */
  YYSYMBOL_type_specifier = 52,            /* type_specifier  */
  YYSYMBOL_declaration_list = 53,          /* declaration_list  */
  YYSYMBOL_statements = 54,                /* statements  */
  YYSYMBOL_statement = 55,                 /* statement  */
  YYSYMBOL_expression_statement = 56,      /* expression_statement  */
  YYSYMBOL_variable = 57,                  /* variable  */
  YYSYMBOL_expression = 58,                /* expression  */
  YYSYMBOL_logic_expression = 59,          /* logic_expression  */
  YYSYMBOL_rel_expression = 60,            /* rel_expression  */
  YYSYMBOL_simple_expression = 61,         /* simple_expression  */
  YYSYMBOL_term = 62,                      /* term  */
  YYSYMBOL_unary_expression = 63,          /* unary_expression  */
  YYSYMBOL_factor = 64,                    /* factor  */
  YYSYMBOL_argument_list = 65,             /* argument_list  */
  YYSYMBOL_arguments = 66                  /* arguments  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




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

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
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
typedef yytype_int8 yy_state_t;

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
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
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

#if !defined yyoverflow

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
#endif /* !defined yyoverflow */

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
#define YYFINAL  11
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   164

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  43
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  24
/* YYNRULES -- Number of rules.  */
#define YYNRULES  64
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  118

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   297


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

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
      35,    36,    37,    38,    39,    40,    41,    42
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    61,    61,    85,   102,   119,   134,   149,   166,   213,
     256,   276,   298,   321,   344,   367,   389,   406,   424,   469,
     485,   501,   520,   542,   568,   589,   619,   636,   654,   669,
     684,   699,   720,   739,   760,   779,   798,   817,   832,   850,
     865,   885,   900,   920,   935,   954,   969,   988,  1003,  1022,
    1037,  1056,  1072,  1089,  1106,  1121,  1139,  1156,  1171,  1186,
    1203,  1221,  1237,  1253,  1270
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "IF", "ELSE", "FOR",
  "WHILE", "DO", "VOID", "SWITCH", "CASE", "DEFAULT", "BREAK", "CONTINUE",
  "RETURN", "MAIN", "ADDOP", "INCOP", "DECOP", "RELOP", "LOGICOP",
  "ASSIGNOP", "NOT", "MULOP", "BITOP", "ID", "INT", "FLOAT", "CONST_INT",
  "CONST_FLOAT", "DOUBLE", "CONST_CHAR", "CHAR", "LTHIRD", "RTHIRD",
  "LCURL", "RCURL", "LPAREN", "RPAREN", "COMMA", "SEMICOLON", "PRINTLN",
  "LOWER_THAN_ELSE", "$accept", "start", "program", "unit",
  "func_declaration", "func_definition", "parameter_list",
  "compound_statement", "var_declaration", "type_specifier",
  "declaration_list", "statements", "statement", "expression_statement",
  "variable", "expression", "logic_expression", "rel_expression",
  "simple_expression", "term", "unary_expression", "factor",
  "argument_list", "arguments", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-69)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-1)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
      75,   -69,   -69,   -69,    10,    75,   -69,   -69,   -69,   -69,
       4,   -69,   -69,    53,   -17,    21,     0,    26,   -69,    27,
     -22,    81,    42,    33,   -69,    28,   -69,   -69,   -21,    75,
     -69,    47,    52,    55,    67,    66,    66,    66,    72,   -69,
     -69,   -69,    66,   -69,    73,   -69,   -69,    89,    71,   -69,
     -69,    63,    38,   -69,    97,     5,    98,   -69,   -69,   -69,
     -69,   100,    88,    66,   124,    66,    83,    41,   -69,   -69,
      66,    66,    90,   102,    96,   -69,   -69,   -69,   -69,    66,
     -69,    66,    66,    66,    66,   -69,   -69,    92,   124,    93,
     -69,    99,   -69,   103,    95,   -69,   104,   -69,   -69,    98,
     127,   -69,   110,    66,   110,   -69,   -69,    66,   108,   140,
     116,   -69,   -69,   -69,   110,   110,   -69,   -69
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       0,    21,    19,    20,     0,     2,     4,     6,     7,     5,
       0,     1,     3,    24,     0,     0,     0,     0,    18,     0,
       0,     0,    15,    22,    25,     0,     9,    11,     0,     0,
      14,     0,     0,     0,     0,     0,     0,     0,    39,    57,
      58,    17,     0,    37,     0,    30,    28,     0,     0,    26,
      29,    54,     0,    41,    43,    45,    47,    49,    53,     8,
      10,    13,     0,     0,     0,     0,     0,    54,    51,    52,
       0,    62,     0,     0,    24,    16,    27,    59,    60,     0,
      38,     0,     0,     0,     0,    12,    23,     0,     0,     0,
      36,     0,    64,     0,    61,    56,     0,    42,    44,    48,
      46,    50,     0,     0,     0,    40,    55,     0,     0,    32,
       0,    34,    63,    35,     0,     0,    33,    31
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
     -69,   -69,   -69,   150,   -69,   -69,   -69,   -13,    20,    12,
     -69,   -69,   -42,   -48,   -36,   -33,   -68,    76,    77,    74,
     -32,   -69,   -69,   -69
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
       0,     4,     5,     6,     7,     8,    21,    45,    46,    47,
      14,    48,    49,    50,    51,    52,    53,    54,    55,    56,
      57,    58,    93,    94
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int8 yytable[] =
{
      67,    67,    66,    92,    68,    69,    76,    27,     1,    72,
      11,    97,    10,    25,    25,    60,    88,    10,    26,    59,
       9,    82,    17,    18,    83,     9,     2,     3,    22,    13,
      87,    32,    89,    33,    34,    67,     1,    91,    20,   112,
     103,    61,    35,    67,    36,    67,    67,    67,    67,    19,
      37,    23,   101,    38,     2,     3,    39,    40,    77,    78,
     109,    24,   111,    25,    41,    42,    31,    30,    43,    44,
     110,    67,   116,   117,    32,    62,    33,    34,    80,     1,
      77,    78,    36,     1,    79,    35,    15,    36,    37,    63,
      16,    38,    64,    37,    39,    40,    38,     2,     3,    39,
      40,     2,     3,    42,    65,    70,    25,    75,    42,    71,
      73,    43,    44,    32,    74,    33,    34,    81,     1,    28,
      29,    84,    86,    90,    35,    85,    36,    96,    95,    15,
     102,   104,    37,   105,   107,    38,     2,     3,    39,    40,
      36,   106,   108,    82,   114,    25,    37,    42,   113,    38,
      43,    44,    39,    40,   115,    12,    99,    98,     0,     0,
     100,    42,     0,     0,    43
};

static const yytype_int8 yycheck[] =
{
      36,    37,    35,    71,    36,    37,    48,    20,     8,    42,
       0,    79,     0,    35,    35,    28,    64,     5,    40,    40,
       0,    16,    39,    40,    19,     5,    26,    27,    16,    25,
      63,     3,    65,     5,     6,    71,     8,    70,    38,   107,
      88,    29,    14,    79,    16,    81,    82,    83,    84,    28,
      22,    25,    84,    25,    26,    27,    28,    29,    17,    18,
     102,    34,   104,    35,    36,    37,    33,    25,    40,    41,
     103,   107,   114,   115,     3,    28,     5,     6,    40,     8,
      17,    18,    16,     8,    21,    14,    33,    16,    22,    37,
      37,    25,    37,    22,    28,    29,    25,    26,    27,    28,
      29,    26,    27,    37,    37,    33,    35,    36,    37,    37,
      37,    40,    41,     3,    25,     5,     6,    20,     8,    38,
      39,    23,    34,    40,    14,    25,    16,    25,    38,    33,
      38,    38,    22,    34,    39,    25,    26,    27,    28,    29,
      16,    38,    38,    16,     4,    35,    22,    37,    40,    25,
      40,    41,    28,    29,    38,     5,    82,    81,    -1,    -1,
      83,    37,    -1,    -1,    40
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,     8,    26,    27,    44,    45,    46,    47,    48,    51,
      52,     0,    46,    25,    53,    33,    37,    39,    40,    28,
      38,    49,    52,    25,    34,    35,    40,    50,    38,    39,
      25,    33,     3,     5,     6,    14,    16,    22,    25,    28,
      29,    36,    37,    40,    41,    50,    51,    52,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    40,
      50,    52,    28,    37,    37,    37,    58,    57,    63,    63,
      33,    37,    58,    37,    25,    36,    55,    17,    18,    21,
      40,    20,    16,    19,    23,    25,    34,    58,    56,    58,
      40,    58,    59,    65,    66,    38,    25,    59,    60,    62,
      61,    63,    38,    56,    38,    34,    38,    39,    38,    55,
      58,    55,    59,    40,     4,    38,    55,    55
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    43,    44,    45,    45,    46,    46,    46,    47,    47,
      48,    48,    49,    49,    49,    49,    50,    50,    51,    52,
      52,    52,    53,    53,    53,    53,    54,    54,    55,    55,
      55,    55,    55,    55,    55,    55,    55,    56,    56,    57,
      57,    58,    58,    59,    59,    60,    60,    61,    61,    62,
      62,    63,    63,    63,    64,    64,    64,    64,    64,    64,
      64,    65,    65,    66,    66
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     2,     1,     1,     1,     1,     6,     5,
       6,     5,     4,     3,     2,     1,     3,     2,     3,     1,
       1,     1,     3,     6,     1,     4,     1,     2,     1,     1,
       1,     7,     5,     7,     5,     5,     3,     1,     2,     1,
       4,     1,     3,     1,     3,     1,     3,     1,     3,     1,
       3,     2,     2,     1,     1,     4,     3,     1,     1,     2,
       2,     1,     0,     3,     1
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


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

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


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




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
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
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
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
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
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
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
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






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
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
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

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
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
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
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
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

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
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
  case 2: /* start: program  */
#line 62 "1905028.y"
        {
		//write your code in this block in all the similar blocks below

		(yyval.treeNode)=new TreeNode(nullptr,"start : program");

		(yyval.treeNode)->is_Terminal = false;

		(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

		(yyval.treeNode)->first_line=(yyvsp[0].treeNode)->first_line;

		(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

		logout<<"start : program "<<endl;

		(yyval.treeNode)->printchildren(1);

		delete (yyval.treeNode);


	}
#line 1400 "y.tab.c"
    break;

  case 3: /* program: program unit  */
#line 86 "1905028.y"
        {
		
		(yyval.treeNode)=new TreeNode(nullptr,"program : program unit");

		(yyval.treeNode)->is_Terminal = false;

		(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
		
		(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

		(yyval.treeNode)->first_line=(yyvsp[-1].treeNode)->first_line;

		(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

		logout<<"program : program unit "<<endl;
	}
#line 1421 "y.tab.c"
    break;

  case 4: /* program: unit  */
#line 103 "1905028.y"
        {
			
		(yyval.treeNode)=new TreeNode(nullptr,"program : unit");

		(yyval.treeNode)->is_Terminal = false;

		(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

		(yyval.treeNode)->first_line=(yyvsp[0].treeNode)->first_line;

		(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

		logout<<"program : unit "<<endl;
	}
#line 1440 "y.tab.c"
    break;

  case 5: /* unit: var_declaration  */
#line 120 "1905028.y"
        {
		
		(yyval.treeNode)=new TreeNode(nullptr,"unit : var_declaration");

		(yyval.treeNode)->is_Terminal = false;

		(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

		(yyval.treeNode)->first_line=(yyvsp[0].treeNode)->first_line;

		(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

		logout<<"unit : var_declaration "<<endl;
	}
#line 1459 "y.tab.c"
    break;

  case 6: /* unit: func_declaration  */
#line 135 "1905028.y"
                {
		
		(yyval.treeNode)=new TreeNode(nullptr,"unit : func_declaration");

		(yyval.treeNode)->is_Terminal = false;

		(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

		(yyval.treeNode)->first_line=(yyvsp[0].treeNode)->first_line;

		(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

		logout<<"unit : func_declaration "<<endl;
	}
#line 1478 "y.tab.c"
    break;

  case 7: /* unit: func_definition  */
#line 150 "1905028.y"
                {
		
		(yyval.treeNode)=new TreeNode(nullptr,"unit : func_definition");

		(yyval.treeNode)->is_Terminal = false;

		(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

		(yyval.treeNode)->first_line=(yyvsp[0].treeNode)->first_line;

		(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

		logout<<"unit : func_definition "<<endl;
	}
#line 1497 "y.tab.c"
    break;

  case 8: /* func_declaration: type_specifier ID LPAREN parameter_list RPAREN SEMICOLON  */
#line 167 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"func_declaration : type_specifier ID LPAREN parameter_list RPAREN SEMICOLON");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-5].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-4].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-3].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-2].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));
			

			(yyval.treeNode)->first_line=(yyvsp[-5].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"func_declaration : type_specifier ID LPAREN parameter_list RPAREN SEMICOLON "<<endl;
			//change
			// DECLARE_FUNCTION($2->symbol->getName(),$1->symbol->getName(),$4->Nodes_param_list);
			bool inserted=symbol_table.Insert((yyvsp[-4].treeNode)->symbol->getName(),"FUNCTION");
			Symbol_Info* temp=symbol_table.Lookup((yyvsp[-4].treeNode)->symbol->getName());

			if(inserted)
			{
				temp->set_info_type("FUNCTION_DECLARATION");
				temp->set_return_type((yyvsp[-5].treeNode)->symbol->getName());

				for(Symbol_Info* syminfo: (yyvsp[-2].treeNode)->Nodes_param_list)
				{
					temp->add_Param(new Symbol_Info(syminfo->getName(),syminfo->get_data_type()));
				}

			}
			else
			{
				if(temp->get_info_type()=="FUNCTION_DECLARATION")
				{
					errorout<<"Line# "<<(yyval.treeNode)->first_line<<": Redeclaration of function \'"<<(yyvsp[-4].treeNode)->symbol->getName()<<"\'\n";
					error_count++;
				}
			}

		
		}
#line 1548 "y.tab.c"
    break;

  case 9: /* func_declaration: type_specifier ID LPAREN RPAREN SEMICOLON  */
#line 214 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"func_declaration : type_specifier ID LPAREN RPAREN SEMICOLON");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-4].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-3].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-2].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));
			
			

			(yyval.treeNode)->first_line=(yyvsp[-4].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"func_declaration : type_specifier ID LPAREN RPAREN SEMICOLON "<<endl;
			//change
			// DECLARE_FUNCTION($2->symbol->getName(),$1->symbol->getName());
			bool inserted=symbol_table.Insert((yyvsp[-3].treeNode)->symbol->getName(),"FUNCTION");
			Symbol_Info* temp=symbol_table.Lookup((yyvsp[-3].treeNode)->symbol->getName());

			if(inserted)
			{
				temp->set_info_type("FUNCTION_DECLARATION");
				temp->set_return_type((yyvsp[-4].treeNode)->symbol->getName());

			}
			else
			{
				if(temp->get_info_type()=="FUNCTION_DECLARATION")
				{
					errorout<<"Line# "<<(yyval.treeNode)->first_line<<": Redeclaration of function \'"<<(yyvsp[-3].treeNode)->symbol->getName()<<"\'\n";
					error_count++;
				}
			}

		}
#line 1593 "y.tab.c"
    break;

  case 10: /* func_definition: type_specifier ID LPAREN parameter_list RPAREN compound_statement  */
#line 257 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"func_definition : type_specifier ID LPAREN parameter_list RPAREN compound_statement");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-5].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-4].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-3].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-2].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-5].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"func_definition : type_specifier ID LPAREN parameter_list RPAREN compound_statement "<<endl;
		}
#line 1617 "y.tab.c"
    break;

  case 11: /* func_definition: type_specifier ID LPAREN RPAREN compound_statement  */
#line 277 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"func_definition : type_specifier ID LPAREN RPAREN compound_statement");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-4].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-3].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-2].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-4].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"func_definition : type_specifier ID LPAREN RPAREN compound_statement "<<endl;
		}
#line 1640 "y.tab.c"
    break;

  case 12: /* parameter_list: parameter_list COMMA type_specifier ID  */
#line 299 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"parameter_list : parameter_list COMMA type_specifier ID");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-3].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-2].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-3].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"parameter_list  : parameter_list COMMA type_specifier ID "<<endl;
			//change
			(yyvsp[-3].treeNode)->Nodes_param_list.push_back(new Symbol_Info((yyvsp[0].treeNode)->symbol->getName(),"",(yyvsp[-1].treeNode)->symbol->getName()));
			(yyval.treeNode)->Nodes_param_list=(yyvsp[-3].treeNode)->Nodes_param_list;


		}
#line 1667 "y.tab.c"
    break;

  case 13: /* parameter_list: parameter_list COMMA type_specifier  */
#line 322 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"parameter_list : parameter_list COMMA type_specifier");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-2].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-2].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"parameter_list : parameter_list COMMA type_specifier "<<endl;

			//change
			(yyvsp[-2].treeNode)->Nodes_param_list.push_back(new Symbol_Info((yyvsp[0].treeNode)->symbol->getName(),""));
			(yyval.treeNode)->Nodes_param_list=(yyvsp[-2].treeNode)->Nodes_param_list;


		}
#line 1694 "y.tab.c"
    break;

  case 14: /* parameter_list: type_specifier ID  */
#line 345 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"parameter_list : type_specifier ID");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-1].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"parameter_list : type_specifier ID "<<endl;

			//change
			(yyval.treeNode)->Nodes_param_list.push_back(new Symbol_Info((yyvsp[0].treeNode)->symbol->getName(),"",(yyvsp[-1].treeNode)->symbol->getName()));




		}
#line 1721 "y.tab.c"
    break;

  case 15: /* parameter_list: type_specifier  */
#line 368 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"parameter_list : type_specifier");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[0].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"parameter_list : type_specifier "<<endl;

			//change
			(yyval.treeNode)->Nodes_param_list.push_back(new Symbol_Info((yyvsp[0].treeNode)->symbol->getName(),"",(yyvsp[0].treeNode)->symbol->getName()));

		}
#line 1744 "y.tab.c"
    break;

  case 16: /* compound_statement: LCURL statements RCURL  */
#line 390 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"compound_statement : LCURL statements RCURL");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-2].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-2].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"compound_statement : LCURL statements RCURL "<<endl;
		}
#line 1765 "y.tab.c"
    break;

  case 17: /* compound_statement: LCURL RCURL  */
#line 407 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"compound_statement : LCURL RCURL");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-1].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"compound_statement : LCURL RCURL "<<endl;
		}
#line 1785 "y.tab.c"
    break;

  case 18: /* var_declaration: type_specifier declaration_list SEMICOLON  */
#line 425 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"var_declaration : type_specifier declaration_list SEMICOLON");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-2].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-2].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"var_declaration : type_specifier declaration_list SEMICOLON "<<endl;


			//change
			for(Symbol_Info *syminfo: (yyvsp[-1].treeNode)->Nodes_param_list)
			{
				if((yyvsp[-2].treeNode)->symbol->getName()=="void")
				{
					errorout<<"Line# "<<(yyvsp[-1].treeNode)->first_line<<": Variable or field \'"<<syminfo->getName()<<"\' declared void\n";
					error_count++;
					continue;
				}
				bool inserted = symbol_table.Insert(syminfo->getName(),syminfo->getType());
				if(!inserted)
				{
					errorout<<"Line# "<<(yyvsp[-1].treeNode)->first_line<<": \'"<<syminfo->getName()<<"\' redeclared as different kind of symbol\n";
					error_count++;

				}else{
					Symbol_Info* temp=symbol_table.Lookup(syminfo->getName());
					temp->set_data_type((yyvsp[-2].treeNode)->symbol->getName());
					if(syminfo->is_array())temp->set_array_length(syminfo->get_array_length());
				}
			}



		}
#line 1832 "y.tab.c"
    break;

  case 19: /* type_specifier: INT  */
#line 470 "1905028.y"
                {
						//change
			Symbol_Info* symbol=new Symbol_Info("int","INT");
			(yyval.treeNode)=new TreeNode(symbol,"type_specifier : INT");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[0].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"type_specifier	: INT "<<endl;
		}
#line 1852 "y.tab.c"
    break;

  case 20: /* type_specifier: FLOAT  */
#line 486 "1905028.y"
                {
			//change
			Symbol_Info* symbol=new Symbol_Info("float","FLOAT");
			(yyval.treeNode)=new TreeNode(symbol,"type_specifier : FLOAT");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[0].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"type_specifier	: FLOAT "<<endl;
		}
#line 1872 "y.tab.c"
    break;

  case 21: /* type_specifier: VOID  */
#line 502 "1905028.y"
                {
			//change
			Symbol_Info* symbol=new Symbol_Info("void","VOID");

			(yyval.treeNode)=new TreeNode(symbol,"type_specifier : VOID");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[0].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"type_specifier	: VOID "<<endl;
		}
#line 1893 "y.tab.c"
    break;

  case 22: /* declaration_list: declaration_list COMMA ID  */
#line 521 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"declaration_list : declaration_list COMMA ID");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-2].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-2].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"declaration_list : declaration_list COMMA ID "<<endl;

			//change
			(yyvsp[-2].treeNode)->Nodes_param_list.push_back((yyvsp[0].treeNode)->symbol);
			(yyval.treeNode)->Nodes_param_list=(yyvsp[-2].treeNode)->Nodes_param_list;

		}
#line 1919 "y.tab.c"
    break;

  case 23: /* declaration_list: declaration_list COMMA ID LTHIRD CONST_INT RTHIRD  */
#line 543 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"declaration_list : declaration_list COMMA ID LSQUARE CONST_INT RSQUARE");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-5].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-4].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-3].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-2].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-5].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"declaration_list : declaration_list COMMA ID LSQUARE CONST_INT RSQUARE "<<endl;
			//change
			(yyvsp[-3].treeNode)->symbol->set_array_length((yyvsp[-1].treeNode)->symbol->getName());
			(yyvsp[-5].treeNode)->Nodes_param_list.push_back((yyvsp[-3].treeNode)->symbol);
			(yyval.treeNode)->Nodes_param_list=(yyvsp[-5].treeNode)->Nodes_param_list;
		
		
		}
#line 1949 "y.tab.c"
    break;

  case 24: /* declaration_list: ID  */
#line 569 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"declaration_list : ID");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[0].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"declaration_list : ID "<<endl;
			//change

			// $$->Nodes_param_list=new vector<Symbol_Info*>();
			(yyval.treeNode)->Nodes_param_list.push_back((yyvsp[0].treeNode)->symbol);


		}
#line 1974 "y.tab.c"
    break;

  case 25: /* declaration_list: ID LTHIRD CONST_INT RTHIRD  */
#line 591 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"declaration_list : ID LSQUARE CONST_INT RSQUARE");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-3].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-2].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-3].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"declaration_list : ID LSQUARE CONST_INT RSQUARE "<<endl;

			//creating list for the first symbol

			// $$->Nodes_param_list=new vector<Symbol_Info*>();
			(yyvsp[-3].treeNode)->symbol->set_array_length((yyvsp[-1].treeNode)->symbol->getName()); 
			(yyval.treeNode)->Nodes_param_list.push_back((yyvsp[-3].treeNode)->symbol);



		}
#line 2005 "y.tab.c"
    break;

  case 26: /* statements: statement  */
#line 620 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"statements : statement");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[0].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"statements : statement "<<endl;
		}
#line 2024 "y.tab.c"
    break;

  case 27: /* statements: statements statement  */
#line 637 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"statements : statements statement");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-1].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"statements : statements statement "<<endl;
		}
#line 2044 "y.tab.c"
    break;

  case 28: /* statement: var_declaration  */
#line 655 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"statement : var_declaration");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[0].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"statement : var_declaration "<<endl;
		}
#line 2063 "y.tab.c"
    break;

  case 29: /* statement: expression_statement  */
#line 670 "1905028.y"
                        {
			
			(yyval.treeNode)=new TreeNode(nullptr,"statement : expression_statement");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[0].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"statement : expression_statement "<<endl;
		}
#line 2082 "y.tab.c"
    break;

  case 30: /* statement: compound_statement  */
#line 685 "1905028.y"
                        {
			
			(yyval.treeNode)=new TreeNode(nullptr,"statement : compound_statement");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[0].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"statement : compound_statement "<<endl;
		}
#line 2101 "y.tab.c"
    break;

  case 31: /* statement: FOR LPAREN expression_statement expression_statement expression RPAREN statement  */
#line 700 "1905028.y"
                        {
			
			(yyval.treeNode)=new TreeNode(nullptr,"statement : FOR LPAREN expression_statement expression_statement expression RPAREN statement");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-6].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-5].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-4].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-3].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-2].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-6].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"statement : FOR LPAREN expression_statement expression_statement expression RPAREN statement "<<endl;
		}
#line 2126 "y.tab.c"
    break;

  case 32: /* statement: IF LPAREN expression RPAREN statement  */
#line 721 "1905028.y"
                        {
			
			(yyval.treeNode)=new TreeNode(nullptr,"statement : IF LPAREN expression RPAREN statement");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-4].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-3].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-2].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-4].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"statement : IF LPAREN expression RPAREN statement "<<endl;
		}
#line 2149 "y.tab.c"
    break;

  case 33: /* statement: IF LPAREN expression RPAREN statement ELSE statement  */
#line 740 "1905028.y"
                        {
			
			(yyval.treeNode)=new TreeNode(nullptr,"statement : IF LPAREN expression RPAREN statement ELSE statement");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-6].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-5].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-4].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-3].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-2].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-6].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"statement : IF LPAREN expression RPAREN statement ELSE statement "<<endl;
		}
#line 2174 "y.tab.c"
    break;

  case 34: /* statement: WHILE LPAREN expression RPAREN statement  */
#line 761 "1905028.y"
                        {
			
			(yyval.treeNode)=new TreeNode(nullptr,"statement : WHILE LPAREN expression RPAREN statement");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-4].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-3].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-2].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-4].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"statement : WHILE LPAREN expression RPAREN statement "<<endl;
		}
#line 2197 "y.tab.c"
    break;

  case 35: /* statement: PRINTLN LPAREN ID RPAREN SEMICOLON  */
#line 780 "1905028.y"
                        {
			
			(yyval.treeNode)=new TreeNode(nullptr,"statement : PRINTLN LPAREN ID RPAREN SEMICOLON");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-4].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-3].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-2].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-4].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"statement : PRINTLN LPAREN ID RPAREN SEMICOLON "<<endl;
		}
#line 2220 "y.tab.c"
    break;

  case 36: /* statement: RETURN expression SEMICOLON  */
#line 799 "1905028.y"
                        {
			
			(yyval.treeNode)=new TreeNode(nullptr,"statement : RETURN expression SEMICOLON");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-2].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-2].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"statement : RETURN expression SEMICOLON "<<endl;
		}
#line 2241 "y.tab.c"
    break;

  case 37: /* expression_statement: SEMICOLON  */
#line 818 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"expression_statement : SEMICOLON");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[0].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"expression_statement : SEMICOLON "<<endl;
		}
#line 2260 "y.tab.c"
    break;

  case 38: /* expression_statement: expression SEMICOLON  */
#line 833 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"expression_statement : expression SEMICOLON");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-1].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"expression_statement : expression SEMICOLON "<<endl;
		}
#line 2280 "y.tab.c"
    break;

  case 39: /* variable: ID  */
#line 851 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"variable : ID");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[0].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"variable : ID "<<endl;
		}
#line 2299 "y.tab.c"
    break;

  case 40: /* variable: ID LTHIRD expression RTHIRD  */
#line 866 "1905028.y"
                        {
			
			(yyval.treeNode)=new TreeNode(nullptr,"variable : ID LSQUARE expression RSQUARE");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-3].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-2].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-3].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"variable : ID LSQUARE expression RSQUARE "<<endl;
		}
#line 2321 "y.tab.c"
    break;

  case 41: /* expression: logic_expression  */
#line 886 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"expression : logic_expression");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[0].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"expression : logic_expression "<<endl;
		}
#line 2340 "y.tab.c"
    break;

  case 42: /* expression: variable ASSIGNOP logic_expression  */
#line 901 "1905028.y"
                        {
			
			(yyval.treeNode)=new TreeNode(nullptr,"expression : variable ASSIGNOP logic_expression");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-2].treeNode));
			
			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-2].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"expression : variable ASSIGNOP logic_expression "<<endl;
		}
#line 2362 "y.tab.c"
    break;

  case 43: /* logic_expression: rel_expression  */
#line 921 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"logic_expression : rel_expression");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[0].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"logic_expression : rel_expression "<<endl;
		}
#line 2381 "y.tab.c"
    break;

  case 44: /* logic_expression: rel_expression LOGICOP rel_expression  */
#line 936 "1905028.y"
                                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"logic_expression : rel_expression LOGICOP rel_expression");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-2].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-2].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"logic_expression : rel_expression LOGICOP rel_expression "<<endl;
		}
#line 2402 "y.tab.c"
    break;

  case 45: /* rel_expression: simple_expression  */
#line 955 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"rel_expression : simple_expression");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[0].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"rel_expression	: simple_expression "<<endl;
		}
#line 2421 "y.tab.c"
    break;

  case 46: /* rel_expression: simple_expression RELOP simple_expression  */
#line 970 "1905028.y"
                                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"rel_expression : simple_expression RELOP simple_expression");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-2].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-2].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"rel_expression	: simple_expression RELOP simple_expression "<<endl;
		}
#line 2442 "y.tab.c"
    break;

  case 47: /* simple_expression: term  */
#line 989 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"simple_expression : term");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[0].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"simple_expression : term "<<endl;
		}
#line 2461 "y.tab.c"
    break;

  case 48: /* simple_expression: simple_expression ADDOP term  */
#line 1004 "1905028.y"
                                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"simple_expression : simple_expression ADDOP term");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-2].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-2].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"simple_expression : simple_expression ADDOP term "<<endl;
		}
#line 2482 "y.tab.c"
    break;

  case 49: /* term: unary_expression  */
#line 1023 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"term : unary_expression");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[0].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"term :	unary_expression "<<endl;
		}
#line 2501 "y.tab.c"
    break;

  case 50: /* term: term MULOP unary_expression  */
#line 1038 "1905028.y"
                        {
			
			(yyval.treeNode)=new TreeNode(nullptr,"term : term MULOP unary_expression");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-2].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-2].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"term : term MULOP unary_expression "<<endl;
		}
#line 2522 "y.tab.c"
    break;

  case 51: /* unary_expression: ADDOP unary_expression  */
#line 1057 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"unary_expression : ADDOP unary_expression");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-1].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"unary_expression : ADDOP unary_expression "<<endl;
		}
#line 2542 "y.tab.c"
    break;

  case 52: /* unary_expression: NOT unary_expression  */
#line 1073 "1905028.y"
                                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"unary_expression : NOT unary_expression");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-1].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"unary_expression : NOT unary_expression "<<endl;
		}
#line 2563 "y.tab.c"
    break;

  case 53: /* unary_expression: factor  */
#line 1090 "1905028.y"
                                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"unary_expression : factor");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[0].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"unary_expression : factor "<<endl;
		}
#line 2582 "y.tab.c"
    break;

  case 54: /* factor: variable  */
#line 1107 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"factor : variable");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[0].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"factor	: variable "<<endl;
		}
#line 2601 "y.tab.c"
    break;

  case 55: /* factor: ID LPAREN argument_list RPAREN  */
#line 1122 "1905028.y"
                        {
			
			(yyval.treeNode)=new TreeNode(nullptr,"factor : ID LPAREN argument_list RPAREN");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-3].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-2].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-3].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"factor : ID LPAREN argument_list RPAREN "<<endl;
		}
#line 2623 "y.tab.c"
    break;

  case 56: /* factor: LPAREN expression RPAREN  */
#line 1140 "1905028.y"
                        {
			
			(yyval.treeNode)=new TreeNode(nullptr,"factor : LPAREN expression RPAREN");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-2].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-2].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"factor : LPAREN expression RPAREN "<<endl;
		}
#line 2644 "y.tab.c"
    break;

  case 57: /* factor: CONST_INT  */
#line 1157 "1905028.y"
                        {
			
			(yyval.treeNode)=new TreeNode(nullptr,"factor : CONST_INT");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[0].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"factor : CONST_INT "<<endl;
		}
#line 2663 "y.tab.c"
    break;

  case 58: /* factor: CONST_FLOAT  */
#line 1172 "1905028.y"
                        {
			
			(yyval.treeNode)=new TreeNode(nullptr,"factor : CONST_FLOAT");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[0].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"factor : CONST_FLOAT "<<endl;
		}
#line 2682 "y.tab.c"
    break;

  case 59: /* factor: variable INCOP  */
#line 1187 "1905028.y"
                        {
			
			(yyval.treeNode)=new TreeNode(nullptr,"factor : variable INCOP");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-1].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"factor : variable INCOP "<<endl;
		}
#line 2703 "y.tab.c"
    break;

  case 60: /* factor: variable DECOP  */
#line 1204 "1905028.y"
                        {
			
			(yyval.treeNode)=new TreeNode(nullptr,"factor : variable DECOP");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-1].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"factor : variable DECOP "<<endl;
		}
#line 2723 "y.tab.c"
    break;

  case 61: /* argument_list: arguments  */
#line 1222 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"argument_list : arguments");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[0].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"argument_list : arguments "<<endl;
		}
#line 2742 "y.tab.c"
    break;

  case 62: /* argument_list: %empty  */
#line 1237 "1905028.y"
                                        {
			
			// $$=new TreeNode(nullptr,"argument_list :");

			// $$->is_Terminal = false;

			// $$->childlist.push_back($1);

			// $$->first_line=$1->first_line;

			// $$->last_line=$1->last_line;

			// logout<<"argument_list :  "<<endl;
		}
#line 2761 "y.tab.c"
    break;

  case 63: /* arguments: arguments COMMA logic_expression  */
#line 1254 "1905028.y"
                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"arguments : arguments COMMA logic_expression");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[-2].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[-1].treeNode));
			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[-2].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"arguments : arguments COMMA logic_expression "<<endl;
		}
#line 2782 "y.tab.c"
    break;

  case 64: /* arguments: logic_expression  */
#line 1271 "1905028.y"
                                {
			
			(yyval.treeNode)=new TreeNode(nullptr,"arguments : logic_expression");

			(yyval.treeNode)->is_Terminal = false;

			(yyval.treeNode)->childlist.push_back((yyvsp[0].treeNode));

			(yyval.treeNode)->first_line=(yyvsp[0].treeNode)->first_line;

			(yyval.treeNode)->last_line=(yyvsp[0].treeNode)->last_line;

			logout<<"arguments : logic_expression "<<endl;

			//change

			// $$->Nodes_param_list()
		}
#line 2805 "y.tab.c"
    break;


#line 2809 "y.tab.c"

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
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

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
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
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
  ++yynerrs;

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

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
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
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
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
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 1292 "1905028.y"

int main(int argc,char *argv[])
{

	// if((fp=fopen(argv[1],"r"))==NULL)
	// {
	// 	printf("Cannot Open Input File.\n");
	// 	exit(1);
	// }

	// fp2= fopen(argv[2],"w");
	// fclose(fp2);
	// fp3= fopen(argv[3],"w");
	// fclose(fp3);
	
	// fp2= fopen(argv[2],"a");
	// fp3= fopen(argv[3],"a");
	

	// yyin=fp;
	// yyparse();
	

	// fclose(fp2);
	// fclose(fp3);

	if(argc != 2){
        cout<<"Please provide input file name and try again. "<<endl;
        return 0;
    }

    FILE *fin=freopen(argv[1],"r",stdin);
	if(fin==NULL){
		printf("Cannot open specified file\n");
		return 0;
	}
	
	freopen("1905028_parsetree.txt","w",stdout);

	yyin= fin;
	yylineno=1;
    yyparse();

	fclose(yyin);
	return 0;
}

