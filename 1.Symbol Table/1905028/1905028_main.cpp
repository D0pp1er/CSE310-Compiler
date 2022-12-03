
#include<bits/stdc++.h>
#include "1905028_SymbolTable.h"
using namespace std;

string Ins[3];
void ProcessInput(int c,char cmd)
{
    string in,tmp;
    int t=0;
    getline(cin,in);
    cout<<in<<endl;
    stringstream strm(in);
    while(strm>>tmp)
    {
        if(t<c)Ins[t]=tmp;
        t++;
    }
    if(t!=c)
    {
        cout<<"\tNumber of parameters mismatch for the command "<<cmd<<endl;
        Ins[2]="F";

    }
    else Ins[2]="T";
}


int main()
{
    freopen("sample_input.txt","r",stdin);
    freopen("output.txt","w",stdout);

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
                ProcessInput(2,'I');
                if(Ins[2]=="T")symboltable.Insert(Ins[0],Ins[1]);
                break;
            }
            case 'L':
            {
                ProcessInput(1,'L');
                if(Ins[2]=="T")symboltable.Lookup(Ins[0]);
                break;
            }
            case 'D':
            {
                ProcessInput(1,'D');
                if(Ins[2]=="T")symboltable.Remove(Ins[0]);
                break;
            }
            case 'P':
            {
                ProcessInput(1,'P');
                if(Ins[2]=="T")
                {
                    if(Ins[0]=="A")symboltable.PrintAllScope();
                    else if(Ins[0]=="C")symboltable.PrintCurrScope();
                }
                break;
            }


            case 'S':
            {
                ProcessInput(0,'S');
                if(Ins[2]=="T")symboltable.Enter_Scope();
                break;
            }

            case 'E':
            {
                ProcessInput(0,'E');
                if(Ins[2]=="T")symboltable.Exit_Scope();
                break;
            }

            case 'Q':
            {
                ProcessInput(0,'Q');
                if(Ins[2]=="T")symboltable.ExitAllScope();
                return 0;
                break;
            }



        }


    }

}
