/*
Name:-              Sum of Two Values
Platform:-          CSES
Date:-              18 January 2022
Type of Problem:-   Searching, (Greedy?), (Sorting?)
Complexity:-        O(n²)
Status:-            Time Limit Error (Wrong Algorithm)

Solution in brief:
-
Sample to understand solution:
Input:-

Output:-

*/

#include <iostream>
#include <vector>
#include <iterator>
#include <algorithm>
#define FOR(i,start,upper_limit) for(i=start;i!=upper_limit;++i)
#define pb push_back
#define all(name) name.begin(),name.end()
using namespace std;
 
void give_me_answer(vector<int> values, int x){
    int pos = 1, num1;
    vector<int>:: iterator itr, itr2;
    FOR(itr,values.begin(),values.end()){
        num1 = *itr;
        *itr = 1000000000;
        itr2 = find(all(values),x-num1);
        if(itr2!=values.end()){
            if(itr==itr2){break;}
            cout<<pos<<" "<<pos + distance(itr,itr2);
            return;
        }
        pos++;
        *itr = num1;
    }
    cout<<"IMPOSSIBLE";
}
 
int main(){
    int n, x, i, a;
    vector<int> values;
    cin>>n;
    cin>>x;
    FOR(i,0,n){
        cin>>a;
        values.pb(a);
    }
    give_me_answer(values,x);
    return 0;
}