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
            hash = ((str[i]) + (hash << 6) + (hash << 16) - hash)%num_buckets;
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

        cout<<"\tScopeTable# "<<Scope_ID<<" created\n";
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

   Symbol_Info *LookUpSymbol(string symbol_name,bool show=true)
   {
        int i= SDBM_Hash(symbol_name);
        Symbol_Info *temp=hash_table[i];
        int pos=1;

        while (temp!=nullptr)
        {
            if(temp->getName()==symbol_name)
            {
                if(show)cout<<"\t"<<"'"<<symbol_name<<"' found in ScopeTable# "<<Scope_ID<<" at position "<<i+1<<", "<<pos<<endl;
                return temp;
            }
            pos++;
            temp=temp->get_nxtptr();
        }
        return nullptr;
   }




    
    bool InsertSymbol(string name, string type)
    {
        
        
        if(LookUpSymbol(name,false)!=nullptr)
        {
            cout<<"\t'"<<name<<"' already exists in the current ScopeTable"<<endl;
            return false; 
        }

        else
        {
            int i = SDBM_Hash(name);
            if(hash_table[i]==nullptr)
            {
                hash_table[i]=new Symbol_Info(name,type);
                cout<<"\tInserted in ScopeTable# "<<Scope_ID<<" at position "<<i+1<<", 1"<<endl;
                return true;
            }

            Symbol_Info *temp1=hash_table[i];
            Symbol_Info *temp2=nullptr;

            int pos=1;

            while (temp1!=nullptr)
            {
                pos++;
                temp2=temp1;
                temp1=temp1->get_nxtptr();
            }
        
            temp2->set_nxtptr(new Symbol_Info(name,type));
            cout<<"\tInserted in ScopeTable# "<<Scope_ID<<" at position "<<i+1<<", "<<pos<<endl;
            return true;
        }
       
    }

    bool delete_Symbol(string name)
    {
        if(LookUpSymbol(name,false)==nullptr)
        {
            cout<<"\tNot found in the current ScopeTable"<<endl;
            return false;
        }

        else
        {
            int i = SDBM_Hash(name);
            Symbol_Info *temp1=hash_table[i];
            Symbol_Info *temp2=nullptr;
            int pos=1;
            while (temp1!=nullptr)
            {
                if(temp1->getName()==name)  
                {
                    if(temp2==nullptr)
                    {
                        hash_table[i]=temp1->get_nxtptr();
                    }
                    else
                    {
                        temp2->set_nxtptr(temp1->get_nxtptr());
                    }
                    delete temp1;
                    cout<<"\tDeleted '"<<name<<"' from ScopeTable# "<<Scope_ID<<" at position "<<i+1<<", "<<pos<<endl;
                    return true;
                }
                temp2=temp1;
                temp1=temp1->get_nxtptr();
                pos++;
            }
            
        }
        return false;
    }


    void Print_ScopeTable()
    {
        cout<<"\tScopeTable# "<<Scope_ID<<endl;
        for(int i=0;i<num_buckets;i++)
        {
            cout<<"\t"<<i+1<<"--> ";
            Symbol_Info *curr=hash_table[i];
            while (curr!=nullptr)
            {
                cout<<*curr<<" ";
                curr=curr->get_nxtptr();                
            }
            cout<<"\n";
            
        }
        cout<<"\n";
    }
};


class Symbol_Table
{   
private:
    Scope_Table *curr;
    int Scope_num_buckets;
    int size=1;

public:

    Symbol_Table(int len)
    {
        
        Scope_num_buckets=len;
        curr=new Scope_Table(size++,len,nullptr);
        
    }

    ~Symbol_Table()
    {
        Scope_Table *temp=curr;
        while (temp!=nullptr)
        {
            curr=curr->getParent();
            delete temp;
            temp=curr;
        }
        
    }

    void Enter_Scope()
    {
        
        curr=new Scope_Table(size++,Scope_num_buckets,curr);
    }

    void Exit_Scope()
    {
        if(curr->getParent()==nullptr)
        {
            cout<<"\tScopeTable# "<<curr->getID()<<" cannot be removed\n";
            return;
        }
        Scope_Table *temp=curr;
        curr=curr->getParent();
        cout<<"\tScopeTable# "<<temp->getID()<<" removed\n";
        delete temp;
    }

    void ExitAllScope()
    {

        while(curr!=nullptr)
        {
            Scope_Table *temp=curr;
            curr=curr->getParent();
            cout<<"\tScopeTable# "<<temp->getID()<<" removed\n";
            delete temp;
        }
    }

    bool Insert(string name,string type)
    {
        if(curr==nullptr)curr=new Scope_Table(size++,Scope_num_buckets,nullptr);
        return curr->InsertSymbol(name,type);
    }

    bool Remove(string name)
    {
        if(curr==nullptr)return false;
        return curr->delete_Symbol(name);
    }

    Symbol_Info *Lookup(string name)
    {
        if(curr==nullptr)return nullptr;

        Symbol_Info *result=curr->LookUpSymbol(name);
        if(result==nullptr)
        {
            Scope_Table *temp=curr->getParent();
            while(temp!=nullptr)
            {
                result=temp->LookUpSymbol(name);
                if(result!=nullptr)break;
                temp=temp->getParent();

            }
        }

        if(result==nullptr)cout<<"\t'"<<name<<"' not found in any of the ScopeTables\n";
        return result;

    }

    void PrintCurrScope()
    {
        if(curr==nullptr)return;
        curr->Print_ScopeTable();
    }

    void PrintAllScope()
    {
        if(curr==nullptr)return;
        Scope_Table *temp=curr;
        while (temp!=nullptr)
        {
            temp->Print_ScopeTable();
            temp=temp->getParent();

        }
    }

    
};


int main()
{
    freopen("inputCompilerOne.txt","r",stdin);
    freopen("outputTwo.txt","w",stdout);
    int n;
    cin>>n;
    int cmdNumber=0;
    Symbol_Table st(n);
    char ch;
    int cnt=0;

    while(true)
    {
        cout<<"Cmd "<<++cmdNumber<<": ";
        cin>>ch;
        //cout<<"Cmd "<<cmdNumber<<": ";
        cout<<ch;
        string str[2];
        //string temp[100]="FAKA";
        if(ch=='I')
        {
            string input;
            int cnt=0;

            getline(cin,input);
            cout<<input<<endl<<"    ";
            stringstream strStream(input);
            string temp;

            while(strStream>>temp){

                if(cnt<2)
                {
                    str[cnt]=temp;
                }
            cnt++;
            }
                if(cnt!=2){
                    cout<<"  Number of parameters mismatch for the command "<<ch<<endl;
                }
                else
                    st.Insert(str[0],str[1]);
            //bool isInserted
        }
        if(ch=='L')
        {
            //cin>>str[0];

            string input;
            int cnt=0;

            getline(cin,input);
            cout<<input<<endl<<"    ";
            stringstream strStream(input);
            string temp;

            while(strStream>>temp){

                if(cnt<1)
                {
                    str[cnt]=temp;
                }
            cnt++;
            }
                if(cnt!=1){
                    cout<<"  Number of parameters mismatch for the command "<<ch<<endl;
                }
                else
                    st.Lookup(str[0]);
        }
        if(ch=='D')
        {
            //cin>>str[0];
            string input;
            int cnt=0;

            getline(cin,input);
            cout<<input<<endl<<"    ";
            stringstream strStream(input);
            string temp;

            while(strStream>>temp){

                if(cnt<1)
                {
                    str[cnt]=temp;
                }
            cnt++;
            }
                if(cnt!=1){
                    cout<<"  Number of parameters mismatch for the command "<<ch<<endl;
                }
                else
                    st.Remove(str[0]);
        }
        if(ch=='P')
        {
            //char chTwo;
            //cin>>chTwo;
            string input;
            int cnt=0;

            getline(cin,input);
            cout<<input<<endl<<"    ";
            stringstream strStream(input);
            string temp;

            while(strStream>>temp){

                if(cnt<1)
                {
                    str[cnt]=temp;
                }
            cnt++;
            }
                if(cnt!=1){
                    cout<<"  Number of parameters mismatch for the command "<<ch<<endl;
                }
                else
                {
                    if(str[0]=="A")
                    {
                        st.PrintAllScope();
                    }
                    else if(str[0]=="C")
                    {
                        st.PrintCurrScope();
                    }
                }

        }
        if(ch=='S')
        {
            string input;
            int cnt=0;

            getline(cin,input);
            cout<<input<<endl<<"    ";
            stringstream strStream(input);
            string temp;

            while(strStream>>temp){

                if(cnt<0)
                {
                    str[cnt]=temp;
                }
            cnt++;
            }
                if(cnt!=0){
                    cout<<"  Number of parameters mismatch for the command "<<ch<<endl;
                }
                else
                    st.Enter_Scope();
        }
        if(ch=='E')
        {
            string input;
            int cnt=0;

            getline(cin,input);
            cout<<input<<endl<<"    ";
            stringstream strStream(input);
            string temp;

            while(strStream>>temp){

                if(cnt<0)
                {
                    str[cnt]=temp;
                }
            cnt++;
            }
                if(cnt!=0){
                    cout<<"  Number of parameters mismatch for the command "<<ch<<endl;
                }
                else
                    st.Exit_Scope();
        }
        if(ch=='Q')
        {
            string input;
            int cnt=0;

            getline(cin,input);
            cout<<input<<endl<<"    ";
            stringstream strStream(input);
            string temp;

            while(strStream>>temp){

                if(cnt<0)
                {
                    str[cnt]=temp;
                }
            cnt++;
            }
            if(cnt!=0){
                cout<<"  Number of parameters mismatch for the command "<<ch<<endl;
            }
            else
            {
                st.ExitAllScope();
                break;
            }
        }
    }
}


