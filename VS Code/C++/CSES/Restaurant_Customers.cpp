/*
Name:-              Restaurant Customers
Platform:-          CSES
Date:-              17 January 2022
Type of Problem:-   Sorting, Greedy, Map
Complexity:-        ???
Status:-            Time Limit Error (Wrong Algorithm)

Solution in brief:
-
Sample to understand solution:
Input:-

Output:-

*/

#include <iostream>
#include <map>
#include <iterator>
#include <numeric>
using namespace std;
#define FOR(i,start,upper_limit) for(i=start;i!=upper_limit;++i)
 
int give_me_answer(map<int,int> customers, map<int,bool> eating, int closes){
   int time = customers.begin()->first, answer = 0, occupied=0;
   map<int,int>::iterator itr_c = customers.begin();
   map<int, bool>:: iterator itr_e = eating.begin();
   while(time<closes){
       itr_c = customers.find(time);
       if(itr_c != customers.end()){
           itr_e = eating.find(itr_c->first);
           itr_e->second = 1;
       }
        itr_e = eating.begin();
        while(itr_e!=eating.end()){
            if(itr_e->second){
                itr_c = customers.find(itr_e->first);
                if(itr_c->second == time){
                    itr_e->second = 0;
                }
            }
            occupied+=itr_e->second;
            ++itr_e;
        }  
        if(answer<occupied){answer=occupied;}
        ++time;
        occupied = 0;
   }
    return answer;
}
 
int main(){
    int n,i,a,b,closes=0;
    cin>>n;
    map<int,int> customers;
    map<int,bool> eating;
    FOR(i,0,n){
        cin>>a;
        cin>>b;
        customers.insert(make_pair(a,b));
        eating.insert(make_pair(a,0));
        if(closes<b){closes=b;}
    }
    cout<<give_me_answer(customers,eating,closes);
    return 0;
}