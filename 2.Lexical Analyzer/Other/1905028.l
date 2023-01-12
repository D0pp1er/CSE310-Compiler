%option noyywrap

%x STRING_STATE
%x SINGLE_LINE_COMMENT_STATE
%x MULTILINE_COMMENT_STATE



%{

#include<bits/stdc++.h>
#include "1905028_SymbolInfo.h"
#include "1905028_ScopeTable.h"
#include "1905028_SymbolTable.h"

using namespace std;

int line_count=1;
int lexeme_start_line=0; 
int errors=0;
string current_lexeme;
string str_token;
bool single_line_string=true;

ofstream tokenout;



int bucket=10;
Symbol_Table symbolTable(bucket);

string Uppercase(string temp)
{
	for(auto &t:temp)
	{t=toupper(t);}
	return temp;
}


char Lexeme_To_Char(const char* temp)
{	
	if(strlen(temp)==3)return temp[1];
	else if(temp[2]=='n')return '\n';
	else if(temp[2]=='a')return '\a';
	else if(temp[2]=='t')return '\t';
	else if(temp[2]=='\\')return '\\';
	else if(temp[2]=='r')return '\r';
	else if(temp[2]=='b')return '\b';
	else if(temp[2]=='0')return '\0';
	else if(temp[2]=='v')return '\v';
	else if(temp[2]=='\"')return '\"';
	else if(temp[2]=='f')return '\f';

	return '\a';
}

// FILE *logout;
// FILE *tokenout;



void Print_log(int l,string t, string lex)
{
	cout<<"Line# "<<l<<": Token <"<<t<<"> Lexeme "<<lex<<" found\n";
}


void Print_token(string t,string l)
{
	tokenout<<"<"<<t<<", "<<l<<">\n";
}


void Print_error(int l, string s,string msg)
{
	cout<<"Error at line# "<<l<<": "<<msg<<" "<<s<<"\n";
}

string ESC_IN_STRING(string temp)
{
	// cout<<"In escape processor\n";
	if(temp[1]=='n')return "\n";
	else if(temp[1]=='a')return "\a";
	else if(temp[1]=='t')return "\t";
	else if(temp[1]=='\\')return "\\";
	else if(temp[1]=='\'')return "\'";
	else if(temp[1]=='r')return "\r";
	else if(temp[1]=='b')return "\b";
	else if(temp[1]=='0')return "\0";
	else if(temp[1]=='v')return "\v";
	else if(temp[1]=='\"')return "\"";
	else if(temp[1]=='f')return "\f";

	return "z";	
}



%}
KEYWORD for|do|while|if|else|switch|case|break|default|continue|return|void|char|int|float|double
CONST_CHAR \'[^\\\n\r']\'
WHITESPACE [ \t\v]+
LETTER [a-zA-Z]
DIGIT [0-9]
NEWLINE (\r)?\n

EXPONENT [eE][+-]?{DIGIT}+
CONST_INT [0-9]+
CONST_FLOAT {DIGIT}+(\.{DIGIT}+)?{EXPONENT}?
IDENTIFIER [a-zA-Z_][a-zA-Z0-9_]*
CONST_ESC_CHAR \'\\[ntafrb0\\']\'
ESCAPE \\0|\\v|\\b|\\r|\\f|\\\"|\\\'|\\\\|\\a|\\t|\\n

%%
{WHITESPACE} {}
{NEWLINE} {line_count++;}
{KEYWORD} {
	Print_token(Uppercase(yytext),yytext);
	Print_log(line_count,Uppercase(yytext),yytext);
}

{CONST_INT} {
	Print_token("CONST_INT",yytext);
	Print_log(line_count,"CONST_INT",yytext);
}

{CONST_FLOAT} {
	Print_token("CONST_FLOAT",yytext);
	Print_log(line_count,"CONST_FLOAT",yytext);
}

{IDENTIFIER} {
	Print_token("ID",yytext);
	Print_log(line_count,"ID",yytext);
	if(symbolTable.Insert(yytext,"ID"))symbolTable.PrintAllScope();

}

{CONST_CHAR}|{CONST_ESC_CHAR} {
	// Print_log(line_count,"CONST_CHAR",Lexeme_To_Char(yytext));
	cout<<"Line# "<<line_count<<": Token <CONST_CHAR> Lexeme "<<Lexeme_To_Char(yytext)<<" found\n";
	tokenout << "<CONST_CHAR, " << Lexeme_To_Char(yytext) << ">\n";

}
	/*operator*/

"+"|"-" {
    Print_token("ADDOP",yytext);
	Print_log(line_count,"ADDOP",yytext);
}

"*"|"/"|"%"  {
	Print_token("MULOP",yytext);
	Print_log(line_count,"MULOP",yytext);
}

"++"|"--"  {
	Print_token("INCOP",yytext);
	Print_log(line_count,"INCOP",yytext);
}


"<"|"<="|">"|">="|"=="|"!="  {   
	Print_token("RELOP",yytext);
	Print_log(line_count,"RELOP",yytext);
}

"&"|"|"|"^"|"<<"|">>" {
	Print_token("BITOP",yytext);
	Print_log(line_count,"BITOP",yytext);
}


"="  {
	Print_token("ASSIGNOP",yytext);
	Print_log(line_count,"ASSIGNOP",yytext);
}

"&&"|"||"  {
	Print_token("LOGICOP",yytext);
	Print_log(line_count,"LOGICOP",yytext);
}

"!"  {
	Print_token("NOT",yytext);
	Print_log(line_count,"NOT",yytext);
}

"("  {
	Print_token("LPAREN",yytext);
	Print_log(line_count,"LPAREN",yytext);
}

")"  {
	Print_token("RPAREN",yytext);
	Print_log(line_count,"RPAREN",yytext);
}

"{"  {
	Print_token("LCURL",yytext);
	Print_log(line_count,"LCURL",yytext);
    symbolTable.Enter_Scope();
}

"}"  {
	Print_token("RCURL",yytext);
	Print_log(line_count,"RCURL",yytext);
    symbolTable.Exit_Scope();
}

"["  {
	Print_token("LSQUARE",yytext);
	Print_log(line_count,"LSQUARE",yytext);
}
"]"  {
	Print_token("RSQUARE",yytext);
	Print_log(line_count,"RSQUARE",yytext);
}

","  {
	Print_token("COMMA",yytext);
	Print_log(line_count,"COMMA",yytext);
}

";"  {
	Print_token("SEMICOLON",yytext);
	Print_log(line_count,"SEMICOLON",yytext);
}

"//" {
	lexeme_start_line=line_count;
	current_lexeme=yytext;
	// cout<<"Comment Start\n";
	BEGIN SINGLE_LINE_COMMENT_STATE;
	
}

<SINGLE_LINE_COMMENT_STATE>. {
	current_lexeme+=yytext;
}

<SINGLE_LINE_COMMENT_STATE>\\{NEWLINE} {
	current_lexeme+=yytext;line_count++;
	// cout<<"new line in comment\n";
}

<SINGLE_LINE_COMMENT_STATE>{NEWLINE} {
	line_count++;
	// cout<<"Comment End\n";
	Print_log(lexeme_start_line,"SINGLE LINE COMMENT",current_lexeme);
	BEGIN INITIAL;
}

<SINGLE_LINE_COMMENT_STATE><<EOF>> {
	line_count++;
	// cout<<"Comment End\n";
	Print_log(lexeme_start_line,"SINGLE LINE COMMENT",current_lexeme);
	symbolTable.PrintAllScope();
	cout<<"Total lines: "<<line_count<<"\n";
	cout<<"Total errors: "<<errors<<"\n";
	return 0;
}

"/*" {
	current_lexeme=yytext;
	lexeme_start_line=line_count;
	BEGIN MULTILINE_COMMENT_STATE;
}

<MULTILINE_COMMENT_STATE>. {
	current_lexeme+=yytext;
}
<MULTILINE_COMMENT_STATE>{NEWLINE} {
	line_count++;current_lexeme+=yytext;
}

<MULTILINE_COMMENT_STATE>"*/" {
	current_lexeme+=yytext;
	Print_log(lexeme_start_line,"MULTI LINE COMMENT",current_lexeme);
	BEGIN INITIAL;
}

<MULTILINE_COMMENT_STATE><<EOF>> {
	Print_error(line_count,current_lexeme,"UNFINISHED_COMMENT");
	errors++;
	// line_count--;
	symbolTable.PrintAllScope();
	cout<<"Total lines: "<<line_count<<"\n";
	cout<<"Total errors: "<<errors<<"\n";
	return 0;
}


\" {
	str_token="";
	single_line_string=true;
	current_lexeme=yytext;
	lexeme_start_line=line_count;
	BEGIN STRING_STATE;
}

<STRING_STATE>\" {
	current_lexeme+=yytext;
	if(single_line_string){
		Print_log(lexeme_start_line,"SINGLE LINE STRING",current_lexeme);
		Print_token("SINGLE LINE STRING",str_token);
	}
	else{
		Print_log(lexeme_start_line,"MULTI LINE STRING",current_lexeme);
		Print_token("MULTI LINE STRING",str_token);
	}
	
	BEGIN INITIAL;
}

<STRING_STATE>\\\" {
	current_lexeme+=yytext;
	str_token+="\"";
}

<STRING_STATE>{ESCAPE} {
	// cout<<"Found escape char\n";
	str_token+=ESC_IN_STRING(yytext);
	current_lexeme+=yytext;
}

<STRING_STATE>\\{NEWLINE} {
	current_lexeme+=yytext;
	line_count++;
	single_line_string=false;
}

<STRING_STATE>{NEWLINE} {
	errors++;
	Print_error(line_count++,current_lexeme,"UNFINISHED_STRING");
	BEGIN INITIAL;
}

<STRING_STATE><<EOF>> {
	line_count--;errors++;
	Print_error(line_count,current_lexeme,"UNFINISHED_STRING");
	symbolTable.PrintAllScope();
	cout<<"Total lines: "<<line_count<<"\n";
	cout<<"Total errors: "<<errors<<"\n";
	return 0;
}

<STRING_STATE>. {
	current_lexeme+=yytext;
	str_token+=yytext;
}

{DIGIT}*(\.{DIGIT}*)+(\.{DIGIT}*)+{EXPONENT}? {
	Print_error(line_count,yytext,"TOO_MANY_DECIMAL_POINTS");
	errors++;
}

{DIGIT}*[eE][+-]?{DIGIT}*(\.{DIGIT}*)+ {
	Print_error(line_count,yytext,"ILLFORMED_NUMBER");
	errors++;
}

\'.[^\'\r\n]+\' {
	Print_error(line_count,yytext,"MULTICHAR_CONST_CHAR");
	errors++;
}

{CONST_FLOAT}+{IDENTIFIER}+ {
	Print_error(line_count,yytext,"INVALID_ID_SUFFIX_NUM_PREFIX");
	errors++;
}

\'\' {
	Print_error(line_count,yytext,"EMPTY_CONST_CHAR");
	errors++;
}

\'(\\\')?[^\'\n\r] {
	Print_error(line_count,yytext,"UNFINISHED_CONST_CHAR");
	errors++;
}



<<EOF>> {
	symbolTable.PrintAllScope();
	cout<<"Total lines: "<<line_count<<"\n";
	cout<<"Total errors: "<<errors<<"\n";
	return 0;
}


. {
	Print_error(line_count,yytext,"UNRECOGNIZED_CHAR");
	errors++;
}







			

%%

int main(int argc, char** argv) {
	if(argc!=2){
		printf("Please provide input file name and try again\n");
		return 0;
	}
	
	FILE *fin=fopen(argv[1],"r");
	if(fin==NULL){
		printf("Cannot open specified file\n");
		return 0;
	}
	
	tokenout.open("1905028_token.txt");
	freopen("1905028_log.txt","w",stdout);

	yyin= fin;
	yylex();
	fclose(yyin);
	
	return 0;
}
