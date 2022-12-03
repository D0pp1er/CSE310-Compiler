
#include<bits/stdc++.h>
#include "SymbolTable.h"
using namespace std;

pair<bool,pair<string,string>> ProcessInput(int c,char cmd)
{
    string in,tmp,out[2];
    int t=0;
    getline(cin,in);
    cout<<in<<endl;
    stringstream strm(in);
    while(strm>>tmp)
    {
        if(t<c)out[t]=tmp;
        t++;
    }
    if(t!=c)
    {   
        cout<<"\tNumber of parameters mismatch for the command "<<cmd<<endl;
        return make_pair(false,make_pair("O","O"));
    }
    else if(c==1) return make_pair(true,make_pair(out[0],"O"));
    else if(c==0) return make_pair(true,make_pair("O","O"));
    else if(c==2) return make_pair(true,make_pair(out[0],out[1]));

    return make_pair(false,make_pair("O","O"));

}


int main()
{
    freopen("inputCompilerOne.txt","r",stdin);
    freopen("output11.txt","w",stdout);

    int len;
    cin>>len;
    Symbol_Table symboltable(len);
    int cmd_num=1;
    char Instruction;
    while (1)
    {
        cin>>Instruction;
        cout<<"Cmd "<<cmd_num++<<": "<<Instruction;
        switch(Instruction)
        {
            case 'I':
            {
                pair<bool,pair<string,string>> Ins=ProcessInput(2,'I');
                if(Ins.first)symboltable.Insert(Ins.second.first,Ins.second.second);
                break;
            }
            case 'L':
            {
                pair<bool,pair<string,string>> Ins=ProcessInput(1,'L');
                if(Ins.first)symboltable.Lookup(Ins.second.first);
                break;
            }
            case 'D':
            {
                pair<bool,pair<string,string>> Ins=ProcessInput(1,'D');
                if(Ins.first)symboltable.Remove(Ins.second.first);
                break;
            }
            case 'P':
            {
                pair<bool,pair<string,string>> Ins=ProcessInput(1,'P');
                if(Ins.first)
                {
                    if(Ins.second.first=="A")symboltable.PrintAllScope();
                    else if(Ins.second.first=="C")symboltable.PrintCurrScope();
                }
                break;
            }


            case 'S':
            {
                pair<bool,pair<string,string>> Ins=ProcessInput(0,'S');
                if(Ins.first)symboltable.Enter_Scope();
                break;
            }

            case 'E':
            {
                pair<bool,pair<string,string>> Ins=ProcessInput(0,'E');
                if(Ins.first)symboltable.Exit_Scope();
                break;
            }

            case 'Q':
            {
                pair<bool,pair<string,string>> Ins=ProcessInput(0,'Q');
                if(Ins.first)symboltable.ExitAllScope();
                return 0;
                break;
            }



        }


    }
    
}