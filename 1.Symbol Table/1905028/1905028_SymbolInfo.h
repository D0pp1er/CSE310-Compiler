#pragma once
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