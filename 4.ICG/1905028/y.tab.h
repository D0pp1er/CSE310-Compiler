/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

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
#line 1119 "1905028.y"

    TreeNode* treeNode;

#line 155 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
