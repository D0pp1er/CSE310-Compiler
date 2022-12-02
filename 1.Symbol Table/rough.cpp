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