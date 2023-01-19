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

int error_count;

// ofstream cout("1905028_log_smaple.txt");
ofstream errorout("1905028_error.txt");
ofstream parseTree("1905028_ParseTree.txt");


Symbol_Table symbol_table(11);



void yyerror(char *s)
{
	//write your code
    printf("%s\n",s);
}


void DEFINE_FUNCTION(string func_name,string ret_type,int line,vector<Symbol_Info*> params)
{
	Symbol_Info* syminfo=symbol_table.Lookup(func_name);
	if(syminfo==nullptr)
	{
		symbol_table.Insert(func_name,"FUNCTION");
		syminfo=symbol_table.Lookup(func_name);
	}
	else{

		if(syminfo->get_info_type()=="FUNCTION_DECLARATION")
		{
			if(syminfo->get_return_type()!=ret_type)
			{
				errorout<<"Line# "<<line<<": Return type mismatch with function declaration for \'"<<syminfo->getName()<<"\'\n";
				error_count++;
				return;
			}

			vector<Symbol_Info*> real_param=syminfo->get_Params();
			if(real_param.size()!=params.size())
			{
				errorout<<"Line# "<<line<<": Conflicting types for \'"<<syminfo->getName()<<"\'\n";
				error_count++;
				return;
			}
			if(params.size()!=0)
			{
				for(int i=0;i<real_param.size();i++)
				{
					if(real_param[i]->getType()!=params[i]->get_data_type())
					{
						errorout<<"Line# "<<line<<": Conflicting types for \'"<<syminfo->getName()<<"\'\n";
						error_count++;
						return;
					}
				}
			}
		}
		else{
			errorout<<"Line# "<<line<<": Multiple declaration of  \'"<<syminfo->getName()<<"\'\n";
			error_count++;
			return;
		}
	}

	if(syminfo->get_info_type()=="FUNCTION_DEFINITION")
	{
		errorout<<"Line# "<<line<<": Redefinition of function  \'"<<syminfo->getName()<<"\'\n";
		error_count++;
		return;
	}
	syminfo->set_info_type("FUNCTION_DEFINITION");
	syminfo->set_return_type(ret_type);
	syminfo->set_Param(vector<Symbol_Info*>());
	for(int i=0;i<params.size();i++)
	{
		syminfo->add_Param(new Symbol_Info( params[i]->getName(),params[i]->get_data_type()));
	}

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

		cout<<"start : program "<<endl;

		$$->printchildren(1,parseTree);

		delete $$;


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

		cout<<"program : program unit "<<endl;
	}
	| unit
	{
			
		$$=new TreeNode(nullptr,"program : unit");

		$$->is_Terminal = false;

		$$->childlist.push_back($1);

		$$->first_line=$1->first_line;

		$$->last_line=$1->last_line;

		cout<<"program : unit "<<endl;
	}
	;
	
unit : var_declaration
	{
		
		$$=new TreeNode(nullptr,"unit : var_declaration");

		$$->is_Terminal = false;

		$$->childlist.push_back($1);

		$$->first_line=$1->first_line;

		$$->last_line=$1->last_line;

		cout<<"unit : var_declaration "<<endl;
	}
     | func_declaration
	 	{
		
		$$=new TreeNode(nullptr,"unit : func_declaration");

		$$->is_Terminal = false;

		$$->childlist.push_back($1);

		$$->first_line=$1->first_line;

		$$->last_line=$1->last_line;

		cout<<"unit : func_declaration "<<endl;
	}
     | func_definition
	 	{
		
		$$=new TreeNode(nullptr,"unit : func_definition");

		$$->is_Terminal = false;

		$$->childlist.push_back($1);

		$$->first_line=$1->first_line;

		$$->last_line=$1->last_line;

		cout<<"unit : func_definition "<<endl;
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

			cout<<"func_declaration : type_specifier ID LPAREN parameter_list RPAREN SEMICOLON "<<endl;
			//change
			// DECLARE_FUNCTION($2->symbol->getName(),$1->symbol->getName(),$4->Nodes_param_list);
			bool inserted=symbol_table.Insert($2->symbol->getName(),"FUNCTION");
			Symbol_Info* temp=symbol_table.Lookup($2->symbol->getName());

			if(inserted)
			{
				temp->set_info_type("FUNCTION_DECLARATION");
				temp->set_return_type($1->symbol->getName());

				for(Symbol_Info* syminfo: $4->Nodes_param_list)
				{
					temp->add_Param(new Symbol_Info(syminfo->getName(),syminfo->get_data_type()));
				}

			}
			else
			{
				if(temp->get_info_type()=="FUNCTION_DECLARATION")
				{
					errorout<<"Line# "<<$$->first_line<<": Redeclaration of function \'"<<$2->symbol->getName()<<"\'\n";
					error_count++;
				}
			}

		
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

			cout<<"func_declaration : type_specifier ID LPAREN RPAREN SEMICOLON "<<endl;
			//change
			// DECLARE_FUNCTION($2->symbol->getName(),$1->symbol->getName());
			bool inserted=symbol_table.Insert($2->symbol->getName(),"FUNCTION");
			Symbol_Info* temp=symbol_table.Lookup($2->symbol->getName());

			if(inserted)
			{
				temp->set_info_type("FUNCTION_DECLARATION");
				temp->set_return_type($1->symbol->getName());

			}
			else
			{
				if(temp->get_info_type()=="FUNCTION_DECLARATION")
				{
					errorout<<"Line# "<<$$->first_line<<": Redeclaration of function \'"<<$2->symbol->getName()<<"\'\n";
					error_count++;
				}
			}

		}
		;
		 
func_definition : type_specifier ID LPAREN parameter_list RPAREN{DEFINE_FUNCTION($2->symbol->getName(),$1->symbol->getName(),$1->first_line,$4->Nodes_param_list);} compound_statement
		{
			
			$$=new TreeNode(nullptr,"func_definition : type_specifier ID LPAREN parameter_list RPAREN compound_statement");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);
			$$->childlist.push_back($4);
			$$->childlist.push_back($5);
			$$->childlist.push_back($7);

			$$->first_line=$1->first_line;

			$$->last_line=$7->last_line;

			cout<<"func_definition : type_specifier ID LPAREN parameter_list RPAREN compound_statement "<<endl;
		}
		| type_specifier ID LPAREN RPAREN{DEFINE_FUNCTION($2->symbol->getName(),$1->symbol->getName(),$1->first_line,vector<Symbol_Info*>());} compound_statement
		{
			
			$$=new TreeNode(nullptr,"func_definition : type_specifier ID LPAREN RPAREN compound_statement");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);
			$$->childlist.push_back($4);
			$$->childlist.push_back($6);

			$$->first_line=$1->first_line;

			$$->last_line=$6->last_line;

			cout<<"func_definition : type_specifier ID LPAREN RPAREN compound_statement "<<endl;
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

			cout<<"parameter_list  : parameter_list COMMA type_specifier ID "<<endl;
			//change
			$1->Nodes_param_list.push_back(new Symbol_Info($4->symbol->getName(),"",$3->symbol->getName()));
			$$->Nodes_param_list=$1->Nodes_param_list;


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

			cout<<"parameter_list : parameter_list COMMA type_specifier "<<endl;

			//change
			$1->Nodes_param_list.push_back(new Symbol_Info($3->symbol->getName(),""));
			$$->Nodes_param_list=$1->Nodes_param_list;


		}
 		| type_specifier ID
		{
			
			$$=new TreeNode(nullptr,"parameter_list : type_specifier ID");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);

			$$->first_line=$1->first_line;

			$$->last_line=$2->last_line;

			cout<<"parameter_list : type_specifier ID "<<endl;

			//change
			$$->Nodes_param_list.push_back(new Symbol_Info($2->symbol->getName(),"",$1->symbol->getName()));




		}
		| type_specifier
		{
			
			$$=new TreeNode(nullptr,"parameter_list : type_specifier");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			cout<<"parameter_list : type_specifier "<<endl;

			//change
			$$->Nodes_param_list.push_back(new Symbol_Info($1->symbol->getName(),"",$1->symbol->getName()));

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

			cout<<"compound_statement : LCURL statements RCURL "<<endl;
		}
 		    | LCURL RCURL
		{
			
			$$=new TreeNode(nullptr,"compound_statement : LCURL RCURL");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);

			$$->first_line=$1->first_line;

			$$->last_line=$2->last_line;

			cout<<"compound_statement : LCURL RCURL "<<endl;
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

			cout<<"var_declaration : type_specifier declaration_list SEMICOLON "<<endl;


			//change
			for(Symbol_Info *syminfo: $2->Nodes_param_list)
			{
				if($1->symbol->getName()=="void")
				{
					errorout<<"Line# "<<$2->first_line<<": Variable or field \'"<<syminfo->getName()<<"\' declared void\n";
					error_count++;
					continue;
				}
				bool inserted = symbol_table.Insert(syminfo->getName(),syminfo->getType());
				if(!inserted)
				{
					errorout<<"Line# "<<$2->first_line<<": \'"<<syminfo->getName()<<"\' redeclared as different kind of symbol\n";
					error_count++;

				}else{
					Symbol_Info* temp=symbol_table.Lookup(syminfo->getName());
					temp->set_data_type($1->symbol->getName());
					if(syminfo->is_array())temp->set_array_length(syminfo->get_array_length());
				}
			}



		}
 		 ;
 		 
type_specifier	: INT
		{
						//change
			Symbol_Info* symbol=new Symbol_Info("int","INT");
			$$=new TreeNode(symbol,"type_specifier : INT");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			cout<<"type_specifier	: INT "<<endl;
		}
 		| FLOAT
		{
			//change
			Symbol_Info* symbol=new Symbol_Info("float","FLOAT");
			$$=new TreeNode(symbol,"type_specifier : FLOAT");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			cout<<"type_specifier	: FLOAT "<<endl;
		}
 		| VOID
		{
			//change
			Symbol_Info* symbol=new Symbol_Info("void","VOID");

			$$=new TreeNode(symbol,"type_specifier : VOID");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			cout<<"type_specifier	: VOID "<<endl;
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

			cout<<"declaration_list : declaration_list COMMA ID "<<endl;

			//change
			$1->Nodes_param_list.push_back($3->symbol);
			$$->Nodes_param_list=$1->Nodes_param_list;

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

			cout<<"declaration_list : declaration_list COMMA ID LSQUARE CONST_INT RSQUARE "<<endl;
			//change
			$3->symbol->set_array_length($5->symbol->getName());
			$1->Nodes_param_list.push_back($3->symbol);
			$$->Nodes_param_list=$1->Nodes_param_list;
		
		
		}
 		  | ID
		{
			
			$$=new TreeNode(nullptr,"declaration_list : ID");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			cout<<"declaration_list : ID "<<endl;
			//change

			// $$->Nodes_param_list=new vector<Symbol_Info*>();
			$$->Nodes_param_list.push_back($1->symbol);


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

			cout<<"declaration_list : ID LSQUARE CONST_INT RSQUARE "<<endl;

			//creating list for the first symbol

			// $$->Nodes_param_list=new vector<Symbol_Info*>();
			$1->symbol->set_array_length($3->symbol->getName()); 
			$$->Nodes_param_list.push_back($1->symbol);



		}
 		  ;
 		  
statements : statement
		{
			
			$$=new TreeNode(nullptr,"statements : statement");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			cout<<"statements : statement "<<endl;
		}


	   | statements statement
		{
			
			$$=new TreeNode(nullptr,"statements : statements statement");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);

			$$->first_line=$1->first_line;

			$$->last_line=$2->last_line;

			cout<<"statements : statements statement "<<endl;
		}
	   ;
	   
statement : var_declaration
		{
			
			$$=new TreeNode(nullptr,"statement : var_declaration");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			cout<<"statement : var_declaration "<<endl;
		}
	  | expression_statement
	  		{
			
			$$=new TreeNode(nullptr,"statement : expression_statement");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			cout<<"statement : expression_statement "<<endl;
		}
	  | compound_statement
	  		{
			
			$$=new TreeNode(nullptr,"statement : compound_statement");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			cout<<"statement : compound_statement "<<endl;
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

			cout<<"statement : FOR LPAREN expression_statement expression_statement expression RPAREN statement "<<endl;
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

			cout<<"statement : IF LPAREN expression RPAREN statement "<<endl;
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

			cout<<"statement : IF LPAREN expression RPAREN statement ELSE statement "<<endl;
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

			cout<<"statement : WHILE LPAREN expression RPAREN statement "<<endl;
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

			cout<<"statement : PRINTLN LPAREN ID RPAREN SEMICOLON "<<endl;
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

			cout<<"statement : RETURN expression SEMICOLON "<<endl;
		}
	  ;
	  
expression_statement : SEMICOLON	
		{
			
			$$=new TreeNode(nullptr,"expression_statement : SEMICOLON");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			cout<<"expression_statement : SEMICOLON "<<endl;
		}		
			| expression SEMICOLON 
		{
			
			$$=new TreeNode(nullptr,"expression_statement : expression SEMICOLON");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);

			$$->first_line=$1->first_line;

			$$->last_line=$2->last_line;

			cout<<"expression_statement : expression SEMICOLON "<<endl;
		}
			;
	  
variable : ID
		{
			
			$$=new TreeNode(nullptr,"variable : ID");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			cout<<"variable : ID "<<endl;
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

			cout<<"variable : ID LSQUARE expression RSQUARE "<<endl;
		} 
	 ;
	 
 expression : logic_expression
 		{
			
			$$=new TreeNode(nullptr,"expression : logic_expression");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			cout<<"expression : logic_expression "<<endl;
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

			cout<<"expression : variable ASSIGNOP logic_expression "<<endl;
		} 	
	   ;
			
logic_expression : rel_expression
		{
			
			$$=new TreeNode(nullptr,"logic_expression : rel_expression");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			cout<<"logic_expression : rel_expression "<<endl;
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

			cout<<"logic_expression : rel_expression LOGICOP rel_expression "<<endl;
		} 	
		 ;
			
rel_expression	: simple_expression
		{
			
			$$=new TreeNode(nullptr,"rel_expression : simple_expression");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			cout<<"rel_expression	: simple_expression "<<endl;
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

			cout<<"rel_expression	: simple_expression RELOP simple_expression "<<endl;
		}	
		;
				
simple_expression : term 
		{
			
			$$=new TreeNode(nullptr,"simple_expression : term");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			cout<<"simple_expression : term "<<endl;
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

			cout<<"simple_expression : simple_expression ADDOP term "<<endl;
		} 
		  ;
					
term :	unary_expression
		{
			
			$$=new TreeNode(nullptr,"term : unary_expression");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			cout<<"term :	unary_expression "<<endl;
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

			cout<<"term : term MULOP unary_expression "<<endl;
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

			cout<<"unary_expression : ADDOP unary_expression "<<endl;
		}  
		 | NOT unary_expression
		 		{
			
			$$=new TreeNode(nullptr,"unary_expression : NOT unary_expression");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			
			$$->childlist.push_back($2);

			$$->first_line=$1->first_line;

			$$->last_line=$2->last_line;

			cout<<"unary_expression : NOT unary_expression "<<endl;
		} 
		 | factor
		 		{
			
			$$=new TreeNode(nullptr,"unary_expression : factor");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			cout<<"unary_expression : factor "<<endl;
		} 
		 ;
	
factor	: variable
		{
			
			$$=new TreeNode(nullptr,"factor : variable");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			cout<<"factor	: variable "<<endl;
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

			cout<<"factor : ID LPAREN argument_list RPAREN "<<endl;
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

			cout<<"factor : LPAREN expression RPAREN "<<endl;
		}
	| CONST_INT 
			{
			
			$$=new TreeNode(nullptr,"factor : CONST_INT");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			cout<<"factor : CONST_INT "<<endl;
		}
	| CONST_FLOAT
			{
			
			$$=new TreeNode(nullptr,"factor : CONST_FLOAT");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			cout<<"factor : CONST_FLOAT "<<endl;
		}
	| variable INCOP
			{
			
			$$=new TreeNode(nullptr,"factor : variable INCOP");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			
			$$->childlist.push_back($2);

			$$->first_line=$1->first_line;

			$$->last_line=$2->last_line;

			cout<<"factor : variable INCOP "<<endl;
		} 
	| variable DECOP
			{
			
			$$=new TreeNode(nullptr,"factor : variable DECOP");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);

			$$->first_line=$1->first_line;

			$$->last_line=$2->last_line;

			cout<<"factor : variable DECOP "<<endl;
		}
	;
	
argument_list : arguments
		{
			
			$$=new TreeNode(nullptr,"argument_list : arguments");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			cout<<"argument_list : arguments "<<endl;
		}
			  |
			  		{
			
			// $$=new TreeNode(nullptr,"argument_list :");

			// $$->is_Terminal = false;

			// $$->childlist.push_back($1);

			// $$->first_line=$1->first_line;

			// $$->last_line=$1->last_line;

			// cout<<"argument_list :  "<<endl;
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

			cout<<"arguments : arguments COMMA logic_expression "<<endl;
		}
	      | logic_expression
		  		{
			
			$$=new TreeNode(nullptr,"arguments : logic_expression");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			cout<<"arguments : logic_expression "<<endl;

			//change

			// $$->Nodes_param_list()
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
	
	freopen("1905028_log.txt","w",stdout);

	yyin= fin;
	yylineno=1;
    yyparse();

	fclose(yyin);
	return 0;
}
