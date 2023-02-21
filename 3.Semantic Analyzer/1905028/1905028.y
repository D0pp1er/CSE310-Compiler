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
int stkoffset=0;
bool NegateFlag=false;

// ofstream cout("1905028_log_smaple.txt");
ofstream errorout("1905028_error.txt");
ofstream parseTree("1905028_ParseTree.txt");
ofstream assembler("1905028_code.asm");
vector<Symbol_Info*> function_parameter_list;
vector<Symbol_Info*> global_vars;
int  parameter_list_line_no;
int func_param_list_length=0;

Symbol_Table symbol_table(11);
int label_num=0;
int ret_label=0;


//declaring the functions
void Assemble(TreeNode*);
void Asm_func_def(TreeNode*);
void Asm_var_declaration(TreeNode*);
void Asm_cmpnd_statement(TreeNode*);
void Asm_declaration_list(TreeNode*);
void Asm_statements(TreeNode*);
void Asm_statement(TreeNode*);
void Asm_exprssn_statement(TreeNode*);
void Asm_exprssn(TreeNode*);
void Asm_logic_exprssn(TreeNode*);
void Asm_rel_exprssn(TreeNode*);
void Asm_simple_exprssn(TreeNode*);
void Asm_term(TreeNode*);
void Asm_unary_exprssn(TreeNode*);
void Asm_factor(TreeNode*);
void Asm_arg_list(TreeNode*);
void Asm_args(TreeNode*);
void Asm_Branching(TreeNode*,int);


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
				errorout<<"Line# "<<line<<": Conflicting types for \'"<<syminfo->getName()<<"\'\n";
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
						errorout<<"Line# "<<line<<": Type mismatch for argument "<<i+1<<" of \'"<<syminfo->getName()<<"\'\n";
						error_count++;
						return;
					}
				}
			}
		}
		else{
			errorout<<"Line# "<<line<<": \'"<<syminfo->getName()<<"\' redeclared as different kind of symbol\n";
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

string StringFromSymbol(vector<Symbol_Info*> temp)
{
	string code_text="";
	for(Symbol_Info* syminfo:temp)
	{
		code_text+=syminfo->get_data_type()+" "+syminfo->getName()+",";
	}
	int n=code_text.length();
	if(!n)
	{
		code_text=code_text.substr(0,n-1);
	}
	return code_text;
}


void FUNCTION_CALL(Symbol_Info* &functionSymbol,vector<Symbol_Info*> arguments,int line)
{
	string func_name=functionSymbol->getName();
	Symbol_Info* syminfo=symbol_table.Lookup(func_name);
	if(syminfo==nullptr)
	{
		errorout<<"Line# "<<line<<": Undeclared function \'"<<func_name<<"\'\n";
		error_count++;
		return;
	}

	if(!syminfo->is_Func())
	{
		errorout<<"Line# "<<line<<": \'"<<func_name<<"\' is not a function\n";
		error_count++;
		return;
	}

	functionSymbol->set_return_type(syminfo->get_return_type());
	if(syminfo->get_info_type()!="FUNCTION_DEFINITION")
	{
		errorout<<"Line# "<<line<<": Undeclared function \'"<<func_name<<"\'\n";
		error_count++;
		return;
	}

	vector<Symbol_Info*> real_params=syminfo->get_Params();
	int param_count=arguments.size();
	if(real_params.size()>param_count)
	{
		// //debug
		// for(int i=0;i<arguments.size();i++)
		// {
		// 	errorout<<"debug  --->  given arguments  "<<arguments[i]->get_data_type()<<"   name   "<<arguments[i]->getName()<<endl;
		// }

		// for(int i=0;i<real_params.size();i++)
		// {
		// 	errorout<<"debug  --->   actual arguments  "<<real_params[i]->getType()<<"   name   "<<real_params[i]->getName()<<endl;
		// }

		errorout<<"Line# "<<line<<": Too few arguments to function \'"<<func_name<<"\'\n";
		error_count++;
		return;
	}
	else if(real_params.size()<param_count){

		// //debug
		// for(int i=0;i<arguments.size();i++)
		// {
		// 	errorout<<"debug  --->  given arguments  "<<arguments[i]->get_data_type()<<"   name   "<<arguments[i]->getName()<<endl;
		// }

		// for(int i=0;i<real_params.size();i++)
		// {
		// 	errorout<<"debug  --->   actual arguments  "<<real_params[i]->getType()<<"   name   "<<real_params[i]->getName()<<endl;
		// }


		errorout<<"Line# "<<line<<": Too many arguments to function \'"<<func_name<<"\'\n";
		error_count++;
		return;
	}
	if(arguments.size()){
	for(int i=0;i<real_params.size();i++)
	{
		if(real_params[i]->getType()!=arguments[i]->get_data_type())
		{
			errorout<<"Line# "<<line<<": Type mismatch for argument "<<to_string(i+1)<<" of \'"<<func_name<<"\'\n";
			error_count++;
			// return;
		}
	}
	}


}

void VOID_FUNC_CHECK(Symbol_Info* i,Symbol_Info* j,int line)
{
	if(i->get_data_type()=="void"||j->get_data_type()=="void")
	{
		errorout<<"Line# "<<line<<": Void cannot be used in expression \n";

		error_count++;
	}
}

string Type_Cast_Auto(Symbol_Info* i,Symbol_Info* j)
{
	if(i->get_data_type()==j->get_data_type())return j->get_data_type();

	if(i->get_data_type()=="float"&&j->get_data_type()=="int")
	{
		j->set_data_type("float");
		return "float";
	}
	else if(i->get_data_type()=="int"&&j->get_data_type()=="float")
	{
		i->set_data_type("float");
		return "float";
	}

	if(i->get_data_type()!="void")return i->get_data_type();
	return j->get_data_type();

}

void DECLARE_FUNCTION_PARAMETER(string name,string data_type,int line=yylineno)
{
	if(data_type=="void")
	{
		errorout<<"Line# "<<line<<": Function parameter can't be void \n";
		error_count++;
	}
	if(symbol_table.Insert(name,"ID"))
	{
		Symbol_Info* syminfo=symbol_table.Lookup(name);
		syminfo->set_data_type(data_type);
		return;
	}
		errorout<<"Line# "<<line<<": Redefinition of parameter \'"<<name<<"\'\n";
		error_count++;

}



void DECLARE_FUNCTION_PARAMETER_LIST(vector<Symbol_Info*> &params,int line=yylineno)
{
	if(params.size()==0)return;
	for(Symbol_Info* syminfo:params)
	{
		DECLARE_FUNCTION_PARAMETER(syminfo->getName(),syminfo->getType(),line);
	}
	params.clear();
}
void Print_ln_func()
{
	assembler<<"new_line proc\n\tpush ax\n\tpush dx\n\tmov ah,2\n\tmov dl,cr\n\tint 21h\n\tmov ah,2\n\tmov dl,lf\n\tint 21h\n\tpop dx\n\tpop ax\n\tret\nnew_line endp\n";
}

void Print_output_func()
{
	assembler<<
	"print_output proc  ;print what is in ax\n\tpush ax\n\tpush bx\n\tpush cx\n\tpush dx\n\tpush si\n\tlea si,number\n\tmov bx,10\n\tadd si,4\n\tcmp ax,0\n\tjnge negate\n\tprint:\n";
	assembler<<"\txor dx,dx\n\tdiv bx\n\tmov [si],dl\n\tadd [si],'0'\n\tdec si\n\tcmp ax,0\n\tjne print\n\tinc si\n\tlea dx,si\n\tmov ah,9\n\tint 21h\n\tpop si\n";
	assembler<<"\tpop dx\n\tpop cx\n\tpop bx\n\tpop ax\n\tret\n\tnegate:\n\tpush ax\n\tmov ah,2\n\tmov dl,'-'\n\tint 21h\n\tpop ax\n\tneg ax\n\tjmp print\nprint_output endp\n";
}

void Asm_Branching(TreeNode* treeNode,int Lbl_3)
{
	if(treeNode->symbol->getName()=="IF LPAREN expression RPAREN statement ELSE statement")
	{
		Asm_exprssn(treeNode->childlist[2]);
		int Lbl_1=++label_num;
		int Lbl_2=++label_num;
		assembler<<"\tPOP AX\n";
		assembler<<"\tCMP AX, 0\n";
		assembler<<"\tJNE L"<<Lbl_2<<endl;
		assembler<<"\tJMP L"<<Lbl_1<<endl;
		assembler<<"L"<<Lbl_2<<":\n";
		Asm_statement(treeNode->childlist[4]);
		assembler<<"\tJMP L"<<Lbl_3<<endl;
		assembler<<"L"<<Lbl_1<<":\n";
		Asm_Branching(treeNode->childlist[6],Lbl_3);

	}

	else if(treeNode->symbol->getName()=="IF LPAREN expression RPAREN statement")
	{
		Asm_exprssn(treeNode->childlist[2]);
		assembler<<"\tPOP AX\n";
		assembler<<"\tCMP AX, 0\n";
		assembler<<"\tJE L"<<Lbl_3<<endl;
		Asm_statement(treeNode->childlist[4]);
	}

	else
	{
		Asm_statement(treeNode);
	}
}



void Asm_declaration_list(TreeNode* treeNode)
{
	if(treeNode->childlist.size()==1)
	{
		stkoffset=stkoffset+2;
		treeNode->childlist[0]->symbol->stkoffset=stkoffset;
		symbol_table.Insert(treeNode->childlist[0]->symbol);
		assembler<<"\tSUB SP, 2\n";
	}

	else if(treeNode->childlist.size()==4)
	{
		stkoffset=stkoffset+2*stoi(treeNode->childlist[0]->symbol->get_array_length());
		treeNode->childlist[0]->symbol->stkoffset=stkoffset;
		symbol_table.Insert(treeNode->childlist[0]->symbol);
		assembler<<"\tSUB SP, "<<2*stoi(treeNode->childlist[0]->symbol->get_array_length())<<endl;

	}

	else if(treeNode->childlist.size()==3)
	{
		stkoffset=stkoffset+2;
		treeNode->childlist[2]->symbol->stkoffset=stkoffset;
		symbol_table.Insert(treeNode->childlist[2]->symbol);
		assembler<<"\tSUB SP, 2\n";
		Asm_declaration_list(treeNode->childlist[0]);
	}

	else if(treeNode->childlist.size()==6)
	{
		stkoffset=stkoffset+2*stoi(treeNode->childlist[2]->symbol->get_array_length());
		treeNode->childlist[2]->symbol->stkoffset=stkoffset;
		symbol_table.Insert(treeNode->childlist[2]->symbol);
		assembler<<"\tSUB SP, "<<2*stoi(treeNode->childlist[2]->symbol->get_array_length())<<endl;
		Asm_declaration_list(treeNode->childlist[0]);
	}
}



void Asm_var_declaration(TreeNode* treeNode)
{
	assembler<<"\t\t;variable declaration\n";
	treeNode=treeNode->childlist[1];
	Asm_declaration_list(treeNode);



}

void Asm_args(TreeNode* treeNode)
{
	if(treeNode->symbol->getName()=="arguments COMMA logic_expression")
	{
		Asm_logic_exprssn(treeNode->childlist[2]);
		Asm_args(treeNode->childlist[0]);

	}
	else if(treeNode->symbol->getName()=="logic_expression")
	{
		Asm_logic_exprssn(treeNode->childlist[0]);
	}
}

void  Asm_arg_list(TreeNode* treeNode)
{
	if(treeNode->symbol->getName()=="arguments")
	{
		Asm_args(treeNode->childlist[0]);
	}


}

void Asm_factor(TreeNode* treeNode)
{
	//debug
	if(treeNode->symbol->get_return_type()=="CONST_INT"||treeNode->symbol->get_return_type()=="CONST_FLOAT")
	{
		assembler<<"\tMOV AX, "<<treeNode->childlist[0]->symbol->getName()<<endl;
		if(NegateFlag)
		{
			assembler<<"\tNEG AX\n";
			NegateFlag=false;
		}
		assembler<<"\tPUSH AX\n";
	}
	//debug here
	else if(treeNode->symbol->getName()=="variable")
	{
		string name="";
		if(treeNode->childlist[0]->childlist.size()==1)
		{
			string temp=treeNode->childlist[0]->symbol->getName();
			Symbol_Info* sym=symbol_table.Lookup(temp);
			if(sym->stkoffset==0)name=sym->getName();
			else if(sym->stkoffset>0)name="[BP-"+to_string(sym->stkoffset)+"]";
			else name="[BP+"+to_string((sym->stkoffset)*(-1))+"]";
		}
		else
		{
			string temp=treeNode->childlist[0]->childlist[0]->symbol->getName();
			Symbol_Info* sym=symbol_table.Lookup(temp);
			Asm_exprssn(treeNode->childlist[0]->childlist[2]);
			assembler<<"\tPOP SI\n";
			assembler<<"\tSHL SI,1\n";
			if(sym->stkoffset==0)name=sym->getName()+"[SI]";
			else if(sym->stkoffset>0)
			{
				assembler<<"\tNEG SI\n";
				assembler<<"\tADD SI, "<<sym->stkoffset<<endl;
				name="BP[SI]";
			}
			else
			{
				assembler<<"\tSUB SI, "<<sym->stkoffset<<endl;
				name="BP[SI]";
			}

		}

		assembler<<"\tMOV AX, "<<name<<endl;
		if(NegateFlag)
		{
			assembler<<"\tNEG AX\n";
			NegateFlag=false;
		}
		assembler<<"\tPUSH AX\n";
	}



	else if(treeNode->symbol->getName()=="variable INCOP"||treeNode->symbol->getName()=="variable DECOP")
	{	
		string Opt="";
		if(treeNode->symbol->getName()=="variable INCOP")Opt="INC";
		else Opt="DEC";
		string name="";
		if(treeNode->childlist[0]->childlist.size()==1)
		{
			string temp=treeNode->childlist[0]->childlist[0]->symbol->getName();
			Symbol_Info* sym=symbol_table.Lookup(temp);
			if(sym->stkoffset==0)name=sym->getName();
			else if(sym->stkoffset>0)name="[BP-"+to_string(sym->stkoffset)+"]";
			else name="[BP+"+to_string((sym->stkoffset)*(-1))+"]";
		}
		else
		{
			string temp=treeNode->childlist[0]->childlist[0]->symbol->getName();
			Symbol_Info* sym=symbol_table.Lookup(temp);
			Asm_exprssn(treeNode->childlist[0]->childlist[2]);
			assembler<<"\tPOP SI\n";
			assembler<<"\tSHL SI, 1\n";
			if(sym->stkoffset==0)name=sym->getName()+"[SI]";
			else if(sym->stkoffset>0)
			{
				assembler<<"\tNEG SI\n";
				assembler<<"\tADD SI, "<<sym->stkoffset<<endl;
				name="BP[SI]";
			}
			else
			{
				assembler<<"\tSUB SI, "<<sym->stkoffset<<endl;
				name="BP[SI]";
			}
		}

		assembler<<"\tMOV AX, "<<name<<endl;
		if(NegateFlag)
		{
			assembler<<"\tNEG AX\n";
			NegateFlag=false;
		}

		assembler<<"\tPUSH AX\n";
		// assembler<<"\tINC AX\n";
		assembler<<"\t"<<Opt<<" AX\n";
		assembler<<"\tMOV "<<name<<" , AX\n";

	}

	else if(treeNode->symbol->getName()=="LPAREN expression RPAREN")Asm_exprssn(treeNode->childlist[1]);
	else if(treeNode->symbol->getName()=="ID LPAREN argument_list RPAREN")
	{
		Asm_arg_list(treeNode->childlist[2]);
		assembler<<"\tCALL "<<(treeNode->childlist[0]->symbol->getName())<<endl;
		assembler<<"\tPUSH AX\n";
	}

}



void Asm_unary_exprssn(TreeNode* treeNode)
{
	

	if(treeNode->symbol->getName()=="ADDOP unary_expression")
	{
		if(treeNode->childlist[0]->symbol->getName()=="-")NegateFlag=true;
		Asm_unary_exprssn(treeNode->childlist[1]);
		cout<<"-----------4422 negate is on\n";
	}

	else if(treeNode->symbol->getName()=="NOT unary_expression")
	{
		Asm_unary_exprssn(treeNode->childlist[1]);
		string Lbl_1="L"+to_string(++label_num);
		string Lbl_2="L"+to_string(++label_num);
		string Lbl_3="L"+to_string(++label_num);
		assembler<<"\tPOP AX\n";
		assembler<<"\tCMP AX, 0\n";
		assembler<<"\tJE "<<Lbl_2<<endl;
		assembler<<"\tJMP "<<Lbl_1<<endl;
		assembler<<Lbl_2<<":\n";
		assembler<<"\tMOV AX, 1\n";
		assembler<<"\tPUSH AX\n";
		assembler<<"\tJMP "<<Lbl_3<<endl;
		assembler<<Lbl_1<<":\n";
		assembler<<"\tMOV AX, 0\n";
		assembler<<"\tPUSH AX\n";
		assembler<<Lbl_3<<":\n";

	}
	else if(treeNode->childlist.size()==1)
	{
		Asm_factor(treeNode->childlist[0]);
	}
}



void Asm_term(TreeNode* treeNode)
{
	cout<<"------4433 inside term\n";
	if(treeNode->childlist.size()==3)
	{
		Asm_term(treeNode->childlist[0]);
		Asm_unary_exprssn(treeNode->childlist[2]);
		assembler<<"\tPOP CX\n";
		assembler<<"\tPOP AX\n";
		assembler<<"\tCWD\n";

		string sign=treeNode->childlist[1]->symbol->getName();
		if(sign=="%")
		{
			assembler<<"\tDIV CX\n\tPUSH DX\n";
		}
		else if(sign=="/") assembler<<"\tDIV CX\n\tPUSH AX\n";
		else if(sign=="*") assembler<<"\tMUL CX\n\tPUSH AX\n";

	}
	else {
		Asm_unary_exprssn(treeNode->childlist[0]);
		cout<<"---------4444 found unary expression\n";
	}
}


void Asm_simple_exprssn(TreeNode* treeNode)
{
	if(treeNode->childlist.size()==3)
	{

		Asm_simple_exprssn(treeNode->childlist[0]);
		Asm_term(treeNode->childlist[2]);
		assembler<<"\tPOP DX\n";
		assembler<<"\tPOP AX\n";
		if(treeNode->childlist[1]->symbol->getName()=="-")assembler<<"\tSUB AX, DX\n";
		else assembler<<"\tADD AX, DX\n";
		assembler<<"\tPUSH AX\n";
	}
	else
	{
		Asm_term(treeNode->childlist[0]);
	}
}





void Asm_rel_exprssn(TreeNode* treeNode)
{
	

	if(treeNode->childlist.size()==3)
	{	
		Asm_simple_exprssn(treeNode->childlist[0]);
		Asm_simple_exprssn(treeNode->childlist[2]);

		string Lbl_1="L"+to_string(++label_num);
		string Lbl_2="L"+to_string(++label_num);
		string Lbl_3="L"+to_string(++label_num);

		assembler<<"\tPOP DX\n";
		assembler<<"\tPOP AX\n";
		assembler<<"\tCMP AX,DX\n";

		string sign=treeNode->childlist[1]->symbol->getName();
		if(sign=="<")assembler<<"\tJL "<<Lbl_2<<endl;
		else if(sign=="<=")assembler<<"\tJLE "<<Lbl_2<<endl;
		else if(sign==">")assembler<<"\tJG "<<Lbl_2<<endl;
		else if(sign==">=")assembler<<"\tJGE "<<Lbl_2<<endl;
		else if(sign=="==")assembler<<"\tJE "<<Lbl_2<<endl;
		else if(sign=="!=")assembler<<"\tJNE "<<Lbl_2<<endl;

		assembler<<"\tJMP "<<Lbl_1<<endl;
		assembler<<Lbl_2<<":\n";
		assembler<<"\tMOV AX, 1\n";
		assembler<<"\tPUSH AX\n";
		assembler<<"\tJMP "<<Lbl_3<<endl;
		assembler<<Lbl_1<<":\n";
		assembler<<"\tMOV AX, 0\n";
		assembler<<"\tPUSH AX\n";
		assembler<<Lbl_3<<":\n";
	}
	else
	{
		Asm_simple_exprssn(treeNode->childlist[0]);
	}


}


void Asm_logic_exprssn(TreeNode* treeNode)
{
	
	if(treeNode->childlist.size()==3)
	{
		Asm_rel_exprssn(treeNode->childlist[0]);
		string Lbl_1="L"+to_string(++label_num);
		string Lbl_2="L"+to_string(++label_num);
		string Lbl_3="L"+to_string(++label_num);
		assembler<<"\tPOP AX\n";
		assembler<<"\tCMP AX, 0\n";
		if(treeNode->childlist[1]->symbol->getName()=="||")
		{
			assembler<<"\tJNE "<<Lbl_2<<endl;
			Asm_rel_exprssn(treeNode->childlist[2]);
			assembler<<"\tPOP AX\n";
			assembler<<"\tCMP AX,0\n";
			assembler<<"\tJE "<<Lbl_1<<endl;
			assembler<<Lbl_2<<":\n";
			assembler<<"\tMOV AX, 1\n";
			assembler<<"\tPUSH AX\n";
			assembler<<"\tJMP "<<Lbl_3<<endl;
			assembler<<Lbl_1<<":\n";
			assembler<<"\tMOV AX, 0\n";
			assembler<<"\tPUSH AX\n";
			assembler<<Lbl_3<<":\n";
		}

		else if(treeNode->childlist[1]->symbol->getName()=="&&")
		{
			assembler<<"\tJE "<<Lbl_1<<endl;
			Asm_rel_exprssn(treeNode->childlist[2]);
			assembler<<"\tPOP AX\n";
			assembler<<"\tCMP AX,0\n";
			assembler<<"\tJNE "<<Lbl_2<<endl;
			assembler<<Lbl_1<<":\n";
			assembler<<"\tMOV AX, 0\n";
			assembler<<"\tPUSH AX\n";
			assembler<<"\tJMP "<<Lbl_3<<endl;
			assembler<<Lbl_2<<":\n";
			assembler<<"\tMOV AX, 1\n";
			assembler<<"\tPUSH AX\n";
			assembler<<Lbl_3<<":\n";

		}

	}
	else
	{
		Asm_rel_exprssn(treeNode->childlist[0]);
	}
}

void Asm_exprssn(TreeNode* treeNode)
{
	
	if(treeNode->childlist.size()==3)
	{
		string name="";
		if(treeNode->childlist[0]->childlist.size()==1)
		{
			string temp=(treeNode->childlist[0]->childlist[0]->symbol->getName());
			Symbol_Info* sym=symbol_table.Lookup(temp);
			if(sym->stkoffset==0)name=sym->getName();
			else if(sym->stkoffset>0)name="[BP-"+to_string(sym->stkoffset)+"]";
			else if(sym->stkoffset<0)name="[BP+"+to_string(sym->stkoffset*(-1))+"]";
		}

		else
		{
			string temp=treeNode->childlist[0]->childlist[0]->symbol->getName();
			Symbol_Info* sym = symbol_table.Lookup(temp);
			Asm_exprssn(treeNode->childlist[0]->childlist[2]);
			assembler<<"\tPOP SI\n";
			assembler<<"\tSHL SI,1\n";
			if(sym->stkoffset==0)name=sym->getName()+"[SI]";
			else if(sym->stkoffset>0)
			{
				assembler<<"\tNEG SI\n";
				assembler<<"\tADD SI, "<<sym->stkoffset<<endl;
				name="BP[SI]";
			}

			else if(sym->stkoffset<0)
			{
				assembler<<"\tSUB SI, "<<to_string(sym->stkoffset)<<endl;
				name="BP[SI]";
			}
		}

		Asm_logic_exprssn(treeNode->childlist[2]);
		assembler<<"\tPOP AX\n";
		assembler<<"\tMOV "<<name<<" , AX\n";
		assembler<<"\tPUSH AX\n";
	}

	else
	{
		Asm_logic_exprssn(treeNode->childlist[0]);
	}
}

void Asm_exprssn_statement(TreeNode* treeNode)
{
	if(treeNode->childlist.size()==2)
	{
		Asm_exprssn(treeNode->childlist[0]);
		assembler<<"\tPOP AX\n";
	}
}



void Asm_statement(TreeNode* treeNode)
{

	if(treeNode->symbol->getName()=="var_declaration")
	{
		assembler<<"\t\t;Line no "<<treeNode->first_line<<endl;
		Asm_var_declaration(treeNode->childlist[0]);
	}

	else if( treeNode->symbol->getName()=="expression_statement")
	{
		assembler<<"\t\t; Line no "<<treeNode->first_line<<endl;
		Asm_exprssn_statement(treeNode->childlist[0]);
	}
	
	else if(treeNode->symbol->getName()=="PRINTLN LPAREN ID RPAREN SEMICOLON")
	{
		assembler<<"\t\t;Line no "<<treeNode->first_line<<endl;
		string name=treeNode->childlist[2]->symbol->getName();
		Symbol_Info* sym=symbol_table.Lookup(name);
		string temp="";
		if(sym->stkoffset==0)temp=sym->getName();
		else if(sym->stkoffset>0)temp="[BP-"+to_string(sym->stkoffset)+"]";
		else temp="[BP+"+to_string((sym->stkoffset)*(-1))+"]";
		assembler<<"\t\t;calling println\n";
		assembler<<"\tMOV AX, "<<temp<<endl;
		assembler<<"\tCALL print_output\n";
		assembler<<"\tCALL new_line\n";

	}
	
	else if(treeNode->symbol->getName()=="compound_statement")
	{
		Asm_cmpnd_statement(treeNode->childlist[0]);
	}

	else if(treeNode->symbol->getName()=="RETURN expression SEMICOLON")
	{
		assembler<<"\t\t;Line no "<<treeNode->first_line<<endl;
		Asm_exprssn(treeNode->childlist[1]);
		assembler<<"\tPOP AX\n";
		assembler<<"\tJMP L"<<ret_label<<endl;
	}
	

	else if(treeNode->symbol->getName()=="IF LPAREN expression RPAREN statement")
	{
		assembler<<"\t\t;Line no "<<treeNode->first_line<<endl;
		assembler<<"\t\t;if else statement\n";
		Asm_exprssn(treeNode->childlist[2]);
		assembler<<"\tPOP AX\n";
		assembler<<"\tCMP AX, 0\n";
		int Lbl_1=++label_num;
		assembler<<"\tJE L"<<Lbl_1<<endl;
		Asm_statement(treeNode->childlist[4]);
		assembler<<"L"<<Lbl_1<<":\n";
	}
	
	else if(treeNode->symbol->getName()=="IF LPAREN expression RPAREN statement ELSE statement")
	{
		assembler<<"\t\t;Line no "<<treeNode->first_line<<endl;
		assembler<<"\t\t;if else statement\n";
		Asm_exprssn(treeNode->childlist[2]);
		int Lbl_2=++label_num;
		int Lbl_1=++label_num;
		int Lbl_3=++label_num;
		assembler<<"\tPOP AX\n";
		assembler<<"\tCMP AX, 0\n";
		assembler<<"\tJNE L"<<Lbl_2<<endl;
		assembler<<"\tJMP L"<<Lbl_1<<endl;
		assembler<<"L"<<Lbl_2<<":\n";
		Asm_statement(treeNode->childlist[4]);
		assembler<<"\tJMP L"<<Lbl_3<<endl;
		assembler<<"L"<<Lbl_1<<":\n";
		Asm_Branching(treeNode->childlist[6],Lbl_3);
		assembler<<"L"<<Lbl_3<<":\n";

	}
	
	else if(treeNode->symbol->getName()=="FOR LPAREN expression_statement expression_statement expression RPAREN statement")
	{
		assembler<<"\t\t;Line no "<<treeNode->first_line<<endl;
		assembler<<"\t\t;for loop initialize\n";
		Asm_exprssn_statement(treeNode->childlist[2]);
		int Lbl_1=++label_num;
		int Lbl_2=++label_num;
		assembler<<"L"<<Lbl_1<<":\t\t;loop starts here\n";
		Asm_exprssn_statement(treeNode->childlist[3]);
		assembler<<"\tCMP AX, 0\n";
		assembler<<"\tJE L"<<Lbl_2<<endl;
		Asm_statement(treeNode->childlist[6]);
		Asm_exprssn(treeNode->childlist[4]);
		assembler<<"\tPOP AX\n";
		assembler<<"\tJMP L"<<Lbl_1<<endl;
		assembler<<"L"<<Lbl_2<<":\n";

	}

	else if(treeNode->symbol->getName()=="WHILE LPAREN expression RPAREN statement")
	{
		assembler<<"\t\t;Line no "<<treeNode->first_line<<endl;
		int Lbl_1=++label_num;
		int Lbl_2=++label_num;
		assembler<<"L"<<Lbl_1<<":\t\t;while loop initialize\n";
		Asm_exprssn(treeNode->childlist[2]);
		assembler<<"\tPOP AX\n";
		assembler<<"\tCMP AX, 0\n";
		assembler<<"\tJE L"<<Lbl_2<<endl;
		Asm_statement(treeNode->childlist[4]);
		assembler<<"\tJMP L"<<Lbl_1<<endl;
		assembler<<"L"<<Lbl_2<<":\n";
	}


}




void Asm_statements(TreeNode* treeNode)
{
	if(treeNode->childlist.size()==1) Asm_statement(treeNode->childlist[0]);
	if(treeNode->childlist.size()==2)
	{
		Asm_statements(treeNode->childlist[0]);
		Asm_statement(treeNode->childlist[1]);
		
	}

}




void Asm_cmpnd_statement(TreeNode* treeNode)
{
	if(treeNode->childlist.size()==3)
	{
		
		//asm
		symbol_table.Enter_Scope();
		if(function_parameter_list.size()!=0)
		{
			for(int i=0;i<function_parameter_list.size();i++)
			{
				symbol_table.Insert(*(function_parameter_list[i]));
			}
			function_parameter_list.clear();
		}
		cout<<"----------Asm Scopes\n";
		symbol_table.PrintAllScope();
		Asm_statements(treeNode->childlist[1]);
		symbol_table.Exit_Scope();

	}


}


void Asm_func_def(TreeNode* treeNode)
{
	stkoffset=-2;
	string funcName=treeNode->childlist[1]->symbol->getName();

	assembler<<"\t\t; FUNCTIONS ARE DEFINED HERE\n";
	assembler<<funcName<<" PROC \n";
	if(funcName=="main")
	{
		assembler<<"\tMOV AX, @DATA\n";
		assembler<<"\tMOV DS, AX\n";		
	}

	if(treeNode->childlist.size()==6)
	{
		function_parameter_list=treeNode->childlist[3]->Nodes_param_list;
		for(int i=0;i<function_parameter_list.size();i++)
		{
			stkoffset-=2;
			function_parameter_list[i]->stkoffset=stkoffset;
		}
	}

	stkoffset=0;
	func_param_list_length=function_parameter_list.size();
	assembler<<"\t\t; pushing bp\n";
	assembler<<"\tPUSH BP\n";
	assembler<<"\tMOV BP , SP\n";
	ret_label=++label_num;
	if(treeNode->childlist.size()==6)
	{
		Asm_cmpnd_statement(treeNode->childlist[5]);
	}
	else{
		Asm_cmpnd_statement(treeNode->childlist[4]);
	}

	assembler<<"L"<<ret_label<<":\t\t;returning from a function\n";
	// assembler<<"\tADD SP, "<<stkoffset<<endl;
	assembler<<"\tMOV SP, BP\n";
	assembler<<"\tPOP BP\n";
	if(funcName=="main")
	{
		assembler<<"\tMOV AX,4CH\n";
		assembler<<"\tINT 21H\n";

	}
	else
	{
		if(func_param_list_length>0)
		{
			assembler<<"\tRET "<<2*func_param_list_length<<endl;

		}
		else
		{
			assembler<<"\tRET\n";
		}
		func_param_list_length=0;
	}
	assembler<<funcName<<" ENDP\n";
	stkoffset=0;

}



void Assemble(TreeNode* sym)
{
	//asm
	assembler<<".MODEL SMALL\n";
	assembler<<".STACK 1000H\n";
	assembler<<".Data\n";
	assembler<<"\tCR EQU 0DH\n";
	assembler<<"\tLF EQU 0AH\n";
	assembler<<"\tnumber DB \"00000$\"\n";
	TreeNode* prog=(sym->childlist[0]);
	vector<TreeNode*> units;
	while(prog->childlist.size()==2)
	{
		units.push_back(prog->childlist[1]);
		prog=prog->childlist[0];
	}
	units.push_back(prog->childlist[0]);
	assembler<<"\t\t;global variables are declared here\n";

	for(Symbol_Info* symbol: global_vars)
	{
		if(symbol->is_array()){
			assembler<<"\t"<<symbol->getName()<<" DW "<<symbol->get_array_length()<<" DUP (0000H)\n";
		}
		else
		{
			assembler<<"\t"<<symbol->getName()<<" DW 1 DUP (0000H)\n"; 
		}
	}

	assembler<<".CODE\n";

	for(TreeNode* unit_1:units)
	{
		if(unit_1->symbol!=nullptr){
			if(unit_1->symbol->getName()=="func_definition")
			{
				Asm_func_def(unit_1->childlist[0]);
			}
		}
	}

	Print_ln_func();
	Print_output_func();
	assembler<<"END main\n";
	assembler.close();
	ifstream asm_input("1905028_code.asm");
	string inpt_line;
	vector<string> codes;
	ofstream code_optimizer("1905028_optcode.asm");
	while(getline(asm_input,inpt_line))
	{
		codes.push_back(inpt_line);
	}
	asm_input.close();
	//here
	for(int i=0;i<codes.size();i++)
	{
		if((i+1)>=codes.size()){}
		else if(codes[i].substr(1,3)=="ADD" && codes[i][codes[i].size()-1]=='0')
		{
			code_optimizer<<"\t\t;removed add 0\n";
			continue;
		}

		else if(codes[i].substr(1,3)=="MUL" && codes[i][codes[i].size()-1]=='1')
		{
			code_optimizer<<"\t\t;removed mul 1\n";
			continue;
		}
		else if(codes[i].substr(1,4)=="PUSH" && codes[i+1].substr(1,3)=="POP")
		{
			if(codes[i].substr(6)==codes[i+1].substr(5))
			{
				code_optimizer<<"\t\t;removed consecutive push and pop of same register\n";
				i++;
				continue;
			}
		}

		else if(codes[i].substr(1,3)=="MOV" && codes[i+1].substr(1,3)=="MOV")
		{
			string l1=codes[i].substr(4);
			string l2=codes[i+1].substr(4);
			int j=l1.find(",");
			int k=l2.find(",");
			if(l1.substr(1,j-1)==l2.substr(k+2)&&l1.substr(j+2)==l2.substr(1,k-1))
			{
				code_optimizer<<codes[i]<<"\n";
				code_optimizer<<"\t\t; removed repitive mov \n";
				i++;
				continue;
			}

		}
		code_optimizer<<codes[i]<<"\n";
	}

	code_optimizer.close();

	 

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

		// delete $$;
		Assemble($$);

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
		$$->symbol=new Symbol_Info("func_definition","rule");

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
		$$->symbol=new Symbol_Info("func_definition","rule");

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
			$$->symbol=new Symbol_Info("func_definition","rule");
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
			$$->symbol=new Symbol_Info("func_definition","rule");

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
			function_parameter_list=$$->Nodes_param_list;
			parameter_list_line_no=$$->first_line;



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
			function_parameter_list=$$->Nodes_param_list;
			parameter_list_line_no=$$->first_line;


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
			function_parameter_list=$$->Nodes_param_list;
			parameter_list_line_no=$$->first_line;



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

 		
compound_statement : LCURL{symbol_table.Enter_Scope();DECLARE_FUNCTION_PARAMETER_LIST(function_parameter_list,parameter_list_line_no);} statements RCURL
		{
			
			$$=new TreeNode(nullptr,"compound_statement : LCURL statements RCURL");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($3);
			$$->childlist.push_back($4);

			$$->first_line=$1->first_line;

			$$->last_line=$4->last_line;

			cout<<"compound_statement : LCURL statements RCURL "<<endl;
			//change
			symbol_table.PrintAllScope();
			symbol_table.Exit_Scope();
		}
 		    | LCURL{symbol_table.Enter_Scope();} RCURL
		{
			
			$$=new TreeNode(nullptr,"compound_statement : LCURL RCURL");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($3);

			$$->first_line=$1->first_line;

			$$->last_line=$3->last_line;

			cout<<"compound_statement : LCURL RCURL "<<endl;
			//change
			symbol_table.PrintAllScope();
			symbol_table.Exit_Scope();
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
					errorout<<"Line# "<<$2->first_line<<": Conflicting types for\'"<<syminfo->getName()<<"\'\n";
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

			//asm
			if(symbol_table.curr->getID()==1)
			{
				global_vars.push_back($3->symbol);
			}

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
			//asm
			if(symbol_table.curr->getID()==1)
			{
				global_vars.push_back($3->symbol);
			}
		
		
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

			//asm
			if(symbol_table.curr->getID()==1)
			{
				global_vars.push_back($1->symbol);
			}


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
			//change
			// $$->Nodes_param_list=new vector<Symbol_Info*>();
			$1->symbol->set_array_length($3->symbol->getName()); 
			$$->Nodes_param_list.push_back($1->symbol);

			//asm

			if(symbol_table.curr->getID()==1)
			{
				global_vars.push_back($1->symbol);
			}



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
			//change
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
			//change
		}
	   ;
	   
statement : var_declaration
		{
			
			$$=new TreeNode(nullptr,"statement : var_declaration");

			$$->symbol=new Symbol_Info("var_declaration","rule");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			cout<<"statement : var_declaration "<<endl;
			//change
		}
	  | expression_statement
	  		{
			
			$$=new TreeNode(nullptr,"statement : expression_statement");
			$$->symbol=new Symbol_Info("expression_statement","rule");


			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			cout<<"statement : expression_statement "<<endl;
			//change
		}
	  | compound_statement
	  		{
			
			$$=new TreeNode(nullptr,"statement : compound_statement");
			$$->symbol=new Symbol_Info("compound_statement","rule");


			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			cout<<"statement : compound_statement "<<endl;
			//change
		}
	  | FOR LPAREN expression_statement expression_statement expression RPAREN statement
	  		{
			
			$$=new TreeNode(nullptr,"statement : FOR LPAREN expression_statement expression_statement expression RPAREN statement");
			$$->symbol=new Symbol_Info("FOR LPAREN expression_statement expression_statement expression RPAREN statement","rule");
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
			//change
		}
	  | IF LPAREN expression RPAREN statement %prec LOWER_THAN_ELSE
	  		{
			
			$$=new TreeNode(nullptr,"statement : IF LPAREN expression RPAREN statement");
			$$->symbol=new Symbol_Info("IF LPAREN expression RPAREN statement","rule");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);
			$$->childlist.push_back($4);
			$$->childlist.push_back($5);

			$$->first_line=$1->first_line;

			$$->last_line=$5->last_line;

			cout<<"statement : IF LPAREN expression RPAREN statement "<<endl;
			//change
		}
	  | IF LPAREN expression RPAREN statement ELSE statement
	  		{
			
			$$=new TreeNode(nullptr,"statement : IF LPAREN expression RPAREN statement ELSE statement");
			$$->symbol=new Symbol_Info("IF LPAREN expression RPAREN statement ELSE statement","rule");

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
			//change
		}
	  | WHILE LPAREN expression RPAREN statement
	  		{
			
			$$=new TreeNode(nullptr,"statement : WHILE LPAREN expression RPAREN statement");
			$$->symbol=new Symbol_Info("WHILE LPAREN expression RPAREN statement","rule");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);
			$$->childlist.push_back($4);
			$$->childlist.push_back($5);

			$$->first_line=$1->first_line;

			$$->last_line=$5->last_line;

			cout<<"statement : WHILE LPAREN expression RPAREN statement "<<endl;
			//change

		}
	  | PRINTLN LPAREN ID RPAREN SEMICOLON
	  		{
			
			$$=new TreeNode(nullptr,"statement : PRINTLN LPAREN ID RPAREN SEMICOLON");
			$$->symbol=new Symbol_Info("PRINTLN LPAREN ID RPAREN SEMICOLON","rule");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);
			$$->childlist.push_back($4);
			$$->childlist.push_back($5);

			$$->first_line=$1->first_line;

			$$->last_line=$5->last_line;

			cout<<"statement : PRINTLN LPAREN ID RPAREN SEMICOLON "<<endl;
			//change

			if(!symbol_table.Lookup($3->symbol->getName()))
			{
				errorout<<"Line# "<<$$->first_line<<": Undeclared variable \'"<<$3->symbol->getName()<<"\'\n";
				error_count++;
			}



		}
	  | RETURN expression SEMICOLON
	  		{
			
			$$=new TreeNode(nullptr,"statement : RETURN expression SEMICOLON");
			$$->symbol=new Symbol_Info("RETURN expression SEMICOLON","rule");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);
			$$->childlist.push_back($3);

			$$->first_line=$1->first_line;

			$$->last_line=$3->last_line;

			cout<<"statement : RETURN expression SEMICOLON "<<endl;
			//change
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
			//change
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

			//change

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
			//change

			Symbol_Info *syminfo=symbol_table.Lookup($1->symbol->getName());
			if(syminfo==nullptr)
			{
				errorout<<"Line# "<<$$->first_line<<": Undeclared variable \'"<<$1->symbol->getName()<<"\'\n";
				error_count++;
				$$->symbol=$1->symbol;
			}
			else
			{
				if(syminfo->is_array())
				{
					// errorout<<"Line# "<<$$->first_line<<": Type mismatch for array \'"<<syminfo->getName()<<"\'\n";
					// error_count++;
				}
				$$->symbol=new Symbol_Info(*syminfo);
			}


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

			//change
			Symbol_Info* syminfo=symbol_table.Lookup($1->symbol->getName());
			if(syminfo!=nullptr)
			{
				$1->symbol->set_data_type(syminfo->get_data_type());
				if(!syminfo->is_array())
				{
					errorout<<"Line# "<<$$->first_line<<": \'"<<syminfo->getName()<<"\' is not an array\n";
					error_count++;
				}
				if($3->symbol->get_data_type()!="int")
				{
					errorout<<"Line# "<<$$->first_line<<": Array subscript is not an integer\n";
					error_count++;
				}
			} 
			else
			{
				errorout<<"Line# "<<$$->first_line<<": Undeclared variable \'"<<syminfo->getName()<<"\'\n";
				error_count++;
			}

			// $1->symbol->setName($1->symbol->getName()+"["+$3->symbol->getName()+"]");
			$$->symbol=$1->symbol;

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
			//change
			$$->symbol=$1->symbol;
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
			//change
			

			string code_text=$1->symbol->getName()+"="+$3->symbol->getName();
			// Symbol_Info* syminfo=symbol_table.Lookup($1->symbol->getName());

			//debug
			// if(syminfo==nullptr)
			// {
			// 	errorout<<"------------->line no : "<<$$->first_line<<"   this should not be null\n";
			// 	errorout<<$1->symbol->getName()<<endl;
			// 	errorout<<$1->symbol->get_data_type()<<endl;
			// 	errorout<<$1->symbol->getType()<<endl;

			// }
			// else
			// {
			// 	errorout<<"-------------> line no : "<<$$->first_line<<"     "<<$3->symbol->getName() <<" logics data type "<<$3->symbol->get_data_type()<<"   and    type"<<$3->symbol->getType()<<endl;
			// }





			


			// if(syminfo!=nullptr)
			// {
			// 	if((syminfo->get_data_type()=="int"&& $3->symbol->get_data_type()=="float")||(syminfo->get_data_type()=="int"&& $3->symbol->getType()=="float"))
			// 	{
			// 		errorout<<"Line# "<<$$->first_line<<": Warning: possible loss of data in assignment of FLOAT to INT\n";
			// 		error_count++;
			// 	}
			// }

			
			
			if($1->symbol->get_data_type()=="int"&& $3->symbol->get_data_type()=="float")
			{
				errorout<<"Line# "<<$$->first_line<<": Warning: possible loss of data in assignment of FLOAT to INT\n";
				error_count++;
			}
			
			if($3->symbol->get_data_type()=="void")
			{
				errorout<<"Line# "<<$$->first_line<<": Void cannot be used in expression \n";
				error_count++;
			}
			$$->symbol=new Symbol_Info(code_text,"expression",$1->symbol->getType());


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
			//change
			$$->symbol=$1->symbol;
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
			//change
			string code_text=$1->symbol->getName()+$2->symbol->getName()+$3->symbol->getName();
			$$->symbol=new Symbol_Info(code_text,"logic_expression","int");




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
			//change
			$$->symbol=$1->symbol;
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
			//change
			string code_text=$1->symbol->getName()+$2->symbol->getName()+$3->symbol->getName();
			Type_Cast_Auto($1->symbol,$3->symbol);
			$$->symbol=new Symbol_Info(code_text,"rel_expression","int");


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

			//change
			$$->symbol=$1->symbol;

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
			//change
			
			string code_text=$1->symbol->getName()+$2->symbol->getName()+$3->symbol->getName();
			VOID_FUNC_CHECK($1->symbol,$3->symbol,$$->first_line);
			$$->symbol=new Symbol_Info(code_text,"simple_expression",Type_Cast_Auto($1->symbol,$3->symbol));

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
			//change
			$$->symbol=$1->symbol;
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
			//change
			string code_text=$1->symbol->getName()+$2->symbol->getName()+$3->symbol->getName();
		
			VOID_FUNC_CHECK($1->symbol,$3->symbol,$$->first_line);
			if($2->symbol->getName()=="%")
			{
				if($3->symbol->getName()=="0")
				{
					errorout<<"Line# "<<$$->first_line<<": Warning: division by zero i=0f=1Const=0\n";
					error_count++;
				}

				// if($1->symbol->get_data_type()!="int"||$3->symbol->get_data_type()!="int")
				// {
				// 	errorout<<"Line# "<<$$->first_line<<": Operands of modulus must be integers \n";
				// 	error_count++;
				// }
				// $1->symbol->set_data_type("int");
				// $3->symbol->set_data_type("int");

			}
			$$->symbol=new Symbol_Info(code_text,"term",Type_Cast_Auto($1->symbol,$3->symbol));


		}
     ;

unary_expression : ADDOP unary_expression
		{
			
			$$=new TreeNode(nullptr,"unary_expression : ADDOP unary_expression");
			// $$->symbol=new Symbol_Info("ADDOP unary_expression","rule");
			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			$$->childlist.push_back($2);

			$$->first_line=$1->first_line;

			$$->last_line=$2->last_line;

			cout<<"unary_expression : ADDOP unary_expression "<<endl;
			//change
			$$->symbol=new Symbol_Info("ADDOP unary_expression","unary_ecpression",$2->symbol->get_data_type());




		}  
		 | NOT unary_expression
		 		{
			
			$$=new TreeNode(nullptr,"unary_expression : NOT unary_expression");
			// $$->symbol=new Symbol_Info("NOT unary_expression","rule");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);
			
			$$->childlist.push_back($2);

			$$->first_line=$1->first_line;

			$$->last_line=$2->last_line;

			cout<<"unary_expression : NOT unary_expression "<<endl;
			//change
			$$->symbol=new Symbol_Info("NOT unary_expression","unary_expression",$2->symbol->get_data_type());



		} 
		 | factor
		 		{
			
			$$=new TreeNode(nullptr,"unary_expression : factor");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			cout<<"unary_expression : factor "<<endl;
			//change none cause factor is unary expression now
			$$->symbol=$1->symbol;

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

			//change
			// $$->symbol=$1->symbol;
			$$->symbol=new Symbol_Info("variable","rule");
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
			//change 
			FUNCTION_CALL($1->symbol,$3->Nodes_param_list,$$->first_line);
			string code_text=$1->symbol->getName()+"("+StringFromSymbol($3->Nodes_param_list)+")";
			// $$->symbol=new Symbol_Info(code_text,"function",$1->symbol->get_return_type());
			$$->symbol=new Symbol_Info("ID LPAREN argument_list RPAREN","function",$1->symbol->get_return_type());






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

			//change
			// $$->symbol=new Symbol_Info("("+$2->symbol->getName()+")","factor",$2->symbol->get_data_type());
			$$->symbol=new Symbol_Info("LPAREN expression RPAREN","factor",$2->symbol->get_data_type());


		}
	| CONST_INT 
			{
			
			$$=new TreeNode(nullptr,"factor : CONST_INT");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			cout<<"factor : CONST_INT "<<endl;
			//change
			$$->symbol=new Symbol_Info($1->symbol->getName(),"factor","CONST_INT");

		}
	| CONST_FLOAT
			{
			
			$$=new TreeNode(nullptr,"factor : CONST_FLOAT");

			$$->is_Terminal = false;

			$$->childlist.push_back($1);

			$$->first_line=$1->first_line;

			$$->last_line=$1->last_line;

			cout<<"factor : CONST_FLOAT "<<endl;
			//change
			$$->symbol=new Symbol_Info($1->symbol->getName(),"factor","CONST_FLOAT");

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
			//change
			// $$->symbol=new Symbol_Info($1->symbol->getName()+"++","factor",$1->symbol->get_data_type());
			$$->symbol=new Symbol_Info("variable INCOP","factor",$1->symbol->get_data_type());


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
			//change
			// $$->symbol=new Symbol_Info($1->symbol->getName()+"--","factor",$1->symbol->get_data_type());
			$$->symbol=new Symbol_Info("variable DECOP","factor",$1->symbol->get_data_type());

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

			//change
			$$->Nodes_param_list=$1->Nodes_param_list;
			$$->symbol=new Symbol_Info("arguments","rule");
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
			//change
			$$->Nodes_param_list=$1->Nodes_param_list;
			$$->Nodes_param_list.push_back($3->symbol);

			$$->symbol=new Symbol_Info("arguments COMMA logic_expression","rule");

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
			$$->Nodes_param_list=$1->Nodes_param_list;
			$$->Nodes_param_list.push_back($1->symbol);
			$$->symbol=new Symbol_Info("logic_expression","rule");
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

