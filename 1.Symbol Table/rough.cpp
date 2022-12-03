#include<bits/stdc++.h>
using namespace std;
int SDBM_Hash(string str)
{
    unsigned int hash = 0;
    unsigned int i = 0;
    unsigned int len = str.length();

    for (i = 0; i < len; i++)
    {
        hash = ((str[i]) + (hash << 6) + (hash << 16) - hash)%7;
    }

    return hash;
}


int main()
{
    cout<<SDBM_Hash("foo")<<endl;
}


    // bool InsertSymbol(string name, string type)
    // {
    //     int i = SDBM_Hash(name);
    //     if(hash_table[i]==nullptr)
    //     {
    //         hash_table[i]=new Symbol_Info(name,type);
    //         cout<<"\tInserted in ScopeTable# "<<Scope_ID<<" at position "<<i+1<<", 1"<<endl;
    //         return true;
    //     }

    //     Symbol_Info *temp1=hash_table[i];
    //     Symbol_Info *temp2=nullptr;

    //     int pos=1;

    //     while (temp1!=nullptr)
    //     {
    //         if(temp1->getName()==name)
    //         {
    //             cout<<"\t'"<<name<<"' already exists in the current ScopeTable"<<endl;
    //             return false;
    //         }
    //         pos++;
    //         temp2=temp1;
    //         temp1=temp1->get_nxtptr();
    //     }
        
    //     temp2->set_nxtptr(new Symbol_Info(name,type));
    //     cout<<"\tInserted in ScopeTable# "<<Scope_ID<<" at position "<<i+1<<", "<<pos<<endl;
    //     return true;
    // }