#include<bits/stdc++.h>

using namespace std;

class Symbol_Info{

private:
    string name;
    string type;
    Symbol_Info *nxtptr;

public:

    Symbol_Info(string name, string type)
    {
        this->name=name;
        this->type=type;
        nxtptr=nullptr;
    }

    Symbol_Info()
    {}

    string getName() 
    {
        return name;
    }

    string getType() 
    {
        return type;
    }

    Symbol_Info *get_nxtptr() {
        return nxtptr;
    }

    void setName(string name)
    {
        this->name=name;
    }

    void setType(string type)
    {
        this->type=type;
    }

    void set_nxtptr(Symbol_Info *nxtptr)
    {
        this->nxtptr=nxtptr;
    }

    Symbol_Info(const Symbol_Info &syminfo)
    {
        this->name=syminfo.name;
        this->type=syminfo.type;
        this->nxtptr=syminfo.nxtptr;

    }

    friend ostream &operator<<(ostream& o, Symbol_Info& syminfo)
    {
        o<<"<"<<syminfo.name<<","<<syminfo.type<<">";
        return o;
    }

};


class Scope_Table{

private:
    int num_buckets,Scope_ID;
    Symbol_Info** hash_table;
    Scope_Table* parent_Scope;

    int SDBM_Hash(string str)
    {
        unsigned int hash = 0;
        unsigned int i = 0;
        unsigned int len = str.length();

        for (i = 0; i < len; i++)
        {
            hash = (str[i]) + (hash << 6) + (hash << 16) - hash;
        }

        return hash%num_buckets;
    }

public:


    Scope_Table(int Scope_ID,int num_buckets,Scope_Table *parent_Scope)
    {
        this->Scope_ID=Scope_ID;
        this->num_buckets=num_buckets;
        this->parent_Scope=parent_Scope;

        hash_table=new Symbol_Info*[num_buckets];

        for (int i = 0; i < num_buckets; i++)
        {
            hash_table[i]=nullptr;
        }
    }

    ~Scope_Table()
    {
        for (int i = 0; i < num_buckets; i++)
        {
            if(hash_table[i]!=nullptr)
            {
                Symbol_Info *temp1=hash_table[i];
                while (temp1!=nullptr)
                {
                    Symbol_Info *temp2=temp1;
                    temp1=temp1->get_nxtptr();
                    delete temp2;
                }
            }
        }

        delete[] hash_table;
        
    }

    int getID()
    {
        return Scope_ID;
    }

    int getLength()
    {
        return num_buckets;
    }

    Scope_Table *getParent()
    {
        return parent_Scope;
    }

   Symbol_Info *LookUpSymbol(string symbol_name)
   {
        int i= SDBM_Hash(symbol_name);
        Symbol_Info *temp=hash_table[i];
        int pos=1;

        while (temp!=nullptr)
        {
            if(temp->getName()==symbol_name)
            {
                cout<<"\t"<<"'"<<symbol_name<<"' found in ScopeTable# "<<Scope_ID<<" at position "<<i<<", "<<pos<<endl;
                return temp;
            }
            pos++;
            temp=temp->get_nxtptr();
        }
        return nullptr;
   }







};