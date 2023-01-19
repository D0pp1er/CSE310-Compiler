%{
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

ofstream logout("1905028_log_smaple.txt");
// ofstream parserout("1905028_parsetree.txt");
Symbol_Table symbol_table(11);



void yyerror(char *s)
{
	//write your code
    printf("%s\n",s);
}


%}

%union{
    TreeNode* treeNode;
}

%token <treeNode> IF ELSE FOR WHILE DO VOID SWITCH CASE DEFAULT BREAK CONTINUE RETURN MAIN
%token <treeNode> ADDOP INCOP DECOP RELOP LOGICOP ASSIGNOP NOT MULOP BITOP 
%token <treeNode> ID INT FLOAT CONST_INT CONST_FLOAT DOUBLE CONST_CHAR CHAR
%token <treeNode> LTHIRD RTHIRD LCURL RCURL LPAREN RPAREN COMMA SEMICOLON PRINTLN


%type <treeNode> variable factor term unary_expression simple_expression rel_expression logic_expression expression
%type <treeNode> expression_statement statement statements compound_statement
%type <treeNode> type_specifier var_declaration func_declaration func_definition unit program 
%type <treeNode>  declaration_list parameter_list argument_list arguments start





%nonassoc LOWER_THAN_ELSE
%nonassoc ELSE


%%

start : program
	{
		//write your code in this block in all the similar blocks below

		$$=new TreeNode(nullptr,"start : program");

		$$->is_Terminal = false;

		$$->childlist.push_back($1);

		$$->first_line=$1->first_line;

		$$->last_line=$1->last_line;

		logout<<"start : program "<<endl;

		$$->printchildren(1);


	}
	;

program : program unit 
	{
		
		$$=new TreeNode(nullptr,"program : program unit");

		$$->is_Terminal = false;

		$$->childlist.push_back($1);
		
		$$->childlist.push_back($2);

		$$->first_line=$1->first_line;

		$$->last_line=$2->last_line;

		logout<<"program : program unit "<<endl;
	}
	| unit
	{
			
		$$=new TreeNode(nullptr,"program : unit");

		$$->is_Terminal = false;

		$$->childlist.push_back($1);

		$$->first_line=$1->first_line;

		$$->last_line=$1->last_line;

		logout<<"program : unit "<<endl;
	}
	;
	
unit : var_declaration
	{
		
		$$=new TreeNode(nullptr,"unit : var_declaration");

		$$->is_Terminal = false;

		$$->childlist.push_back($1);

		$$->first_line=$1->first_line;

		$$->last_line=$1->last_line;

		logout<<"unit : var_declaration "<<endl;
	}
     | func_declaration
	 	{
		
		$$=new TreeNode(nullptr,"unit : func_declaration");

		$$->is_Terminal = false;

		$$->childlist.push_back($1);

		$$->first_line=$1->first_line;

		$$->last_line=$1->last_line;

		logout<<"unit : func_declaration "<<endl;
	}
     | func_definition
	 	{
		
		$$=new TreeNode(nullptr,"unit : func_definition");

		$$->is_Terminal = false;

		$$->childlist.push_back($1);

		$$->first_line=$1->first_line;

		$$->last_line=$1->last_line;

		logout<<"unit : func_definition "<<endl;
	}
     ;
     
func_declaration : type_specifier ID LPAREN parameter_list RPAREN SEMICOLON
		{
			
			$$=new TreeNode(nullptr,"func_declaration : type_specifier ID LPAREN parameter_list RPAREN SEMICOLON");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);
			$$->childlist.push_back($4);
			$$->childlist.push_back($5);
			$$->childlist.push_back($6);
			

			$$->first_line=$1->first_line;

			$$->last_line=$6->last_line;

			logout<<"func_declaration : type_specifier ID LPAREN parameter_list RPAREN SEMICOLON "<<endl;
		}
		| type_specifier ID LPAREN RPAREN SEMICOLON
		{
			
			$$=new TreeNode(nullptr,"func_declaration : type_specifier ID LPAREN RPAREN SEMICOLON");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);
			$$->childlist.push_back($4);
			$$->childlist.push_back($5);
			
			

			$$->first_line=$1->first_line;

			$$->last_line=$5->last_line;

			logout<<"func_declaration : type_specifier ID LPAREN RPAREN SEMICOLON "<<endl;
		}
		;
		 
func_definition : type_specifier ID LPAREN parameter_list RPAREN compound_statement
		{
			
			$$=new TreeNode(nullptr,"func_definition : type_specifier ID LPAREN parameter_list RPAREN compound_statement");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);
			$$->childlist.push_back($4);
			$$->childlist.push_back($5);
			$$->childlist.push_back($6);

			$$->first_line=$1->first_line;

			$$->last_line=$6->last_line;

			logout<<"func_definition : type_specifier ID LPAREN parameter_list RPAREN compound_statement "<<endl;
		}
		| type_specifier ID LPAREN RPAREN compound_statement
		{
			
			$$=new TreeNode(nullptr,"func_definition : type_specifier ID LPAREN RPAREN compound_statement");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);
			$$->childlist.push_back($4);
			$$->childlist.push_back($5);

			$$->first_line=$1->first_line;

			$$->last_line=$5->last_line;

			logout<<"func_definition : type_specifier ID LPAREN RPAREN compound_statement "<<endl;
		}
 		;				


parameter_list  : parameter_list COMMA type_specifier ID
		{
			
			$$=new TreeNode(nullptr,"parameter_list : parameter_list COMMA type_specifier ID");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);
			$$->childlist.push_back($4);

			$$->first_line=$1->first_line;

			$$->last_line=$4->last_line;

			logout<<"parameter_list  : parameter_list COMMA type_specifier ID "<<endl;
		}
		| parameter_list COMMA type_specifier
		{
			
			$$=new TreeNode(nullptr,"parameter_list : parameter_list COMMA type_specifier");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);

			$$->first_line=$1->first_line;

			$$->last_line=$3->last_line;

			logout<<"parameter_list : parameter_list COMMA type_specifier "<<endl;
		}
 		| type_specifier ID
		{
			
			$$=new TreeNode(nullptr,"parameter_list : type_specifier ID");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);

			$$->first_line=$1->first_line;

			$$->last_line=$2->last_line;

			logout<<"parameter_list : type_specifier ID "<<endl;
		}
		| type_specifier
		{
			
			$$=new TreeNode(nullptr,"parameter_list : type_specifier");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			logout<<"parameter_list : type_specifier "<<endl;
		}
 		;

 		
compound_statement : LCURL statements RCURL
		{
			
			$$=new TreeNode(nullptr,"compound_statement : LCURL statements RCURL");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);

			$$->first_line=$1->first_line;

			$$->last_line=$3->last_line;

			logout<<"compound_statement : LCURL statements RCURL "<<endl;
		}
 		    | LCURL RCURL
		{
			
			$$=new TreeNode(nullptr,"compound_statement : LCURL RCURL");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);

			$$->first_line=$1->first_line;

			$$->last_line=$2->last_line;

			logout<<"compound_statement : LCURL RCURL "<<endl;
		}
 		    ;
 		    
var_declaration : type_specifier declaration_list SEMICOLON
		{
			
			$$=new TreeNode(nullptr,"var_declaration : type_specifier declaration_list SEMICOLON");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);

			$$->first_line=$1->first_line;

			$$->last_line=$3->last_line;

			logout<<"var_declaration : type_specifier declaration_list SEMICOLON "<<endl;
		}
 		 ;
 		 
type_specifier	: INT
		{
			
			$$=new TreeNode(nullptr,"type_specifier : INT");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			logout<<"type_specifier	: INT "<<endl;
		}
 		| FLOAT
		{
			
			$$=new TreeNode(nullptr,"type_specifier : FLOAT");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			logout<<"type_specifier	: FLOAT "<<endl;
		}
 		| VOID
		{
			
			$$=new TreeNode(nullptr,"type_specifier : VOID");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			logout<<"type_specifier	: VOID "<<endl;
		}
 		;
 		
declaration_list : declaration_list COMMA ID
		{
			
			$$=new TreeNode(nullptr,"declaration_list : declaration_list COMMA ID");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);

			$$->first_line=$1->first_line;

			$$->last_line=$3->last_line;

			logout<<"declaration_list : declaration_list COMMA ID "<<endl;
		}
 		  | declaration_list COMMA ID LTHIRD CONST_INT RTHIRD
		{
			
			$$=new TreeNode(nullptr,"declaration_list : declaration_list COMMA ID LSQUARE CONST_INT RSQUARE");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);
			$$->childlist.push_back($4);
			$$->childlist.push_back($5);
			$$->childlist.push_back($6);

			$$->first_line=$1->first_line;

			$$->last_line=$6->last_line;

			logout<<"declaration_list : declaration_list COMMA ID LSQUARE CONST_INT RSQUARE "<<endl;
		}
 		  | ID
		{
			
			$$=new TreeNode(nullptr,"declaration_list : ID");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			logout<<"declaration_list : ID "<<endl;
		}
 		  | ID LTHIRD CONST_INT RTHIRD

		{
			
			$$=new TreeNode(nullptr,"declaration_list : ID LSQUARE CONST_INT RSQUARE");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);
			$$->childlist.push_back($4);

			$$->first_line=$1->first_line;

			$$->last_line=$4->last_line;

			logout<<"declaration_list : ID LSQUARE CONST_INT RSQUARE "<<endl;
		}
 		  ;
 		  
statements : statement
		{
			
			$$=new TreeNode(nullptr,"statements : statement");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			logout<<"statements : statement "<<endl;
		}


	   | statements statement
		{
			
			$$=new TreeNode(nullptr,"statements : statements statement");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);

			$$->first_line=$1->first_line;

			$$->last_line=$2->last_line;

			logout<<"statements : statements statement "<<endl;
		}
	   ;
	   
statement : var_declaration
		{
			
			$$=new TreeNode(nullptr,"statement : var_declaration");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			logout<<"statement : var_declaration "<<endl;
		}
	  | expression_statement
	  		{
			
			$$=new TreeNode(nullptr,"statement : expression_statement");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			logout<<"statement : expression_statement "<<endl;
		}
	  | compound_statement
	  		{
			
			$$=new TreeNode(nullptr,"statement : compound_statement");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			logout<<"statement : compound_statement "<<endl;
		}
	  | FOR LPAREN expression_statement expression_statement expression RPAREN statement
	  		{
			
			$$=new TreeNode(nullptr,"statement : FOR LPAREN expression_statement expression_statement expression RPAREN statement");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);
			$$->childlist.push_back($4);
			$$->childlist.push_back($5);
			$$->childlist.push_back($6);
			$$->childlist.push_back($7);

			$$->first_line=$1->first_line;

			$$->last_line=$7->last_line;

			logout<<"statement : FOR LPAREN expression_statement expression_statement expression RPAREN statement "<<endl;
		}
	  | IF LPAREN expression RPAREN statement %prec LOWER_THAN_ELSE
	  		{
			
			$$=new TreeNode(nullptr,"statement : IF LPAREN expression RPAREN statement");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);
			$$->childlist.push_back($4);
			$$->childlist.push_back($5);

			$$->first_line=$1->first_line;

			$$->last_line=$5->last_line;

			logout<<"statement : IF LPAREN expression RPAREN statement "<<endl;
		}
	  | IF LPAREN expression RPAREN statement ELSE statement
	  		{
			
			$$=new TreeNode(nullptr,"statement : IF LPAREN expression RPAREN statement ELSE statement");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);
			$$->childlist.push_back($4);
			$$->childlist.push_back($5);
			$$->childlist.push_back($6);
			$$->childlist.push_back($7);

			$$->first_line=$1->first_line;

			$$->last_line=$7->last_line;

			logout<<"statement : IF LPAREN expression RPAREN statement ELSE statement "<<endl;
		}
	  | WHILE LPAREN expression RPAREN statement
	  		{
			
			$$=new TreeNode(nullptr,"statement : WHILE LPAREN expression RPAREN statement");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);
			$$->childlist.push_back($4);
			$$->childlist.push_back($5);

			$$->first_line=$1->first_line;

			$$->last_line=$5->last_line;

			logout<<"statement : WHILE LPAREN expression RPAREN statement "<<endl;
		}
	  | PRINTLN LPAREN ID RPAREN SEMICOLON
	  		{
			
			$$=new TreeNode(nullptr,"statement : PRINTLN LPAREN ID RPAREN SEMICOLON");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);
			$$->childlist.push_back($4);
			$$->childlist.push_back($5);

			$$->first_line=$1->first_line;

			$$->last_line=$5->last_line;

			logout<<"statement : PRINTLN LPAREN ID RPAREN SEMICOLON "<<endl;
		}
	  | RETURN expression SEMICOLON
	  		{
			
			$$=new TreeNode(nullptr,"statement : RETURN expression SEMICOLON");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);

			$$->first_line=$1->first_line;

			$$->last_line=$3->last_line;

			logout<<"statement : RETURN expression SEMICOLON "<<endl;
		}
	  ;
	  
expression_statement : SEMICOLON	
		{
			
			$$=new TreeNode(nullptr,"expression_statement : SEMICOLON");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			logout<<"expression_statement : SEMICOLON "<<endl;
		}		
			| expression SEMICOLON 
		{
			
			$$=new TreeNode(nullptr,"expression_statement : expression SEMICOLON");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);

			$$->first_line=$1->first_line;

			$$->last_line=$2->last_line;

			logout<<"expression_statement : expression SEMICOLON "<<endl;
		}
			;
	  
variable : ID
		{
			
			$$=new TreeNode(nullptr,"variable : ID");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			logout<<"variable : ID "<<endl;
		} 		
	 | ID LTHIRD expression RTHIRD
	 		{
			
			$$=new TreeNode(nullptr,"variable : ID LSQUARE expression RSQUARE");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);
			$$->childlist.push_back($4);

			$$->first_line=$1->first_line;

			$$->last_line=$4->last_line;

			logout<<"variable : ID LSQUARE expression RSQUARE "<<endl;
		} 
	 ;
	 
 expression : logic_expression
 		{
			
			$$=new TreeNode(nullptr,"expression : logic_expression");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			logout<<"expression : logic_expression "<<endl;
		}	
	   | variable ASSIGNOP logic_expression
	   		{
			
			$$=new TreeNode(nullptr,"expression : variable ASSIGNOP logic_expression");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);

			$$->first_line=$1->first_line;

			$$->last_line=$3->last_line;

			logout<<"expression : variable ASSIGNOP logic_expression "<<endl;
		} 	
	   ;
			
logic_expression : rel_expression
		{
			
			$$=new TreeNode(nullptr,"logic_expression : rel_expression");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			logout<<"logic_expression : rel_expression "<<endl;
		} 	
		 | rel_expression LOGICOP rel_expression
		 		{
			
			$$=new TreeNode(nullptr,"logic_expression : rel_expression LOGICOP rel_expression");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);

			$$->first_line=$1->first_line;

			$$->last_line=$3->last_line;

			logout<<"logic_expression : rel_expression LOGICOP rel_expression "<<endl;
		} 	
		 ;
			
rel_expression	: simple_expression
		{
			
			$$=new TreeNode(nullptr,"rel_expression : simple_expression");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			logout<<"rel_expression	: simple_expression "<<endl;
		} 
		| simple_expression RELOP simple_expression
				{
			
			$$=new TreeNode(nullptr,"rel_expression : simple_expression RELOP simple_expression");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);

			$$->first_line=$1->first_line;

			$$->last_line=$3->last_line;

			logout<<"rel_expression	: simple_expression RELOP simple_expression "<<endl;
		}	
		;
				
simple_expression : term 
		{
			
			$$=new TreeNode(nullptr,"simple_expression : term");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			logout<<"simple_expression : term "<<endl;
		}
		  | simple_expression ADDOP term
		  		{
			
			$$=new TreeNode(nullptr,"simple_expression : simple_expression ADDOP term");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);

			$$->first_line=$1->first_line;

			$$->last_line=$3->last_line;

			logout<<"simple_expression : simple_expression ADDOP term "<<endl;
		} 
		  ;
					
term :	unary_expression
		{
			
			$$=new TreeNode(nullptr,"term : unary_expression");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			logout<<"term :	unary_expression "<<endl;
		}
     |  term MULOP unary_expression
	 		{
			
			$$=new TreeNode(nullptr,"term : term MULOP unary_expression");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);

			$$->first_line=$1->first_line;

			$$->last_line=$3->last_line;

			logout<<"term : term MULOP unary_expression "<<endl;
		}
     ;

unary_expression : ADDOP unary_expression
		{
			
			$$=new TreeNode(nullptr,"unary_expression : ADDOP unary_expression");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);

			$$->first_line=$1->first_line;

			$$->last_line=$2->last_line;

			logout<<"unary_expression : ADDOP unary_expression "<<endl;
		}  
		 | NOT unary_expression
		 		{
			
			$$=new TreeNode(nullptr,"unary_expression : NOT unary_expression");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			
			$$->childlist.push_back($2);

			$$->first_line=$1->first_line;

			$$->last_line=$2->last_line;

			logout<<"unary_expression : NOT unary_expression "<<endl;
		} 
		 | factor
		 		{
			
			$$=new TreeNode(nullptr,"unary_expression : factor");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			logout<<"unary_expression : factor "<<endl;
		} 
		 ;
	
factor	: variable
		{
			
			$$=new TreeNode(nullptr,"factor : variable");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			logout<<"factor	: variable "<<endl;
		} 
	| ID LPAREN argument_list RPAREN
			{
			
			$$=new TreeNode(nullptr,"factor : ID LPAREN argument_list RPAREN");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);
			$$->childlist.push_back($4);

			$$->first_line=$1->first_line;

			$$->last_line=$4->last_line;

			logout<<"factor : ID LPAREN argument_list RPAREN "<<endl;
		}
	| LPAREN expression RPAREN
			{
			
			$$=new TreeNode(nullptr,"factor : LPAREN expression RPAREN");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);

			$$->first_line=$1->first_line;

			$$->last_line=$3->last_line;

			logout<<"factor : LPAREN expression RPAREN "<<endl;
		}
	| CONST_INT 
			{
			
			$$=new TreeNode(nullptr,"factor : CONST_INT");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			logout<<"factor : CONST_INT "<<endl;
		}
	| CONST_FLOAT
			{
			
			$$=new TreeNode(nullptr,"factor : CONST_FLOAT");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			logout<<"factor : CONST_FLOAT "<<endl;
		}
	| variable INCOP
			{
			
			$$=new TreeNode(nullptr,"factor : variable INCOP");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			
			$$->childlist.push_back($2);

			$$->first_line=$1->first_line;

			$$->last_line=$2->last_line;

			logout<<"factor : variable INCOP "<<endl;
		} 
	| variable DECOP
			{
			
			$$=new TreeNode(nullptr,"factor : variable DECOP");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);

			$$->first_line=$1->first_line;

			$$->last_line=$2->last_line;

			logout<<"factor : variable DECOP "<<endl;
		}
	;
	
argument_list : arguments
		{
			
			$$=new TreeNode(nullptr,"argument_list : arguments");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			logout<<"argument_list : arguments "<<endl;
		}
			  |
			  		{
			
			// $$=new TreeNode(nullptr,"argument_list :");

			// $$->is_Terminal = false;

			// $$->childlist.push_back($1);

			// $$->first_line=$1->first_line;

			// $$->last_line=$1->last_line;

			// logout<<"argument_list :  "<<endl;
		}
			  ;
	
arguments : arguments COMMA logic_expression
		{
			
			$$=new TreeNode(nullptr,"arguments : arguments COMMA logic_expression");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);

			$$->first_line=$1->first_line;

			$$->last_line=$3->last_line;

			logout<<"arguments : arguments COMMA logic_expression "<<endl;
		}
	      | logic_expression
		  		{
			
			$$=new TreeNode(nullptr,"arguments : logic_expression");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			logout<<"arguments : logic_expression "<<endl;
		}
	      ;
 

%%
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

