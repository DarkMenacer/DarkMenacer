/*
Name:-              Ferris Wheel 
Platform:-          CSES
Date:-              4 Jan 2022
Type of Problem:-   Sorting and Searching
Complexity:-        O(n)
Status:-            Time Limit Error

Solution in brief:
2-pointer method maybe (?)

Sample to understand solution:
Input:-

Output:-

*/

#include <iostream>
#include <set>
#include <iterator>
#define FOR(i,start,upper_limit) for(i=start;i<upper_limit;++i)
using namespace std;

int give_me_answer(int x, multiset<int> input){
    int answer = input.size();
    multiset<int>::iterator itr;
    multiset<int>::reverse_iterator ritr;
    itr = input.begin();
    ritr = input.rbegin();
    while(1){
        if(distance(itr,ritr.base())<=1 || *itr > x/2 || *ritr < x/2){
            if(*ritr < x/2){answer-=(distance(itr,ritr.base())/2);}
            break;
        }
        if(*itr + *ritr <= x){
            --answer;
            ++itr;
        }
        ++ritr;
    }
    return answer;
}

int main(){
    multiset<int> input;
    int n,x,i,p;
    cin>>n>>x;
    FOR(i,0,n){
        cin>>p;
        input.insert(p);
    }
    cout<<give_me_answer(x,input);
    return 0;
}
