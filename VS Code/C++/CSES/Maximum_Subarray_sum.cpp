/*
Name:-              Maximum Subarray Sum
Platform:-          CSES
Date:-              20 January 2022
Type of Problem:-   Searching, (Greedy?), (Sorting?)
Complexity:-        O(n)
Status:-            Wrong Answer (Wrong Algorithm)

Solution in brief:
-
Sample to understand solution:
Input:-

Output:-

*/

#include <iostream>
#include <vector>
#include <iterator>
#include <numeric>
#define FOR(i,start,upper_limit) for(i=start;i<upper_limit;++i)
#define pb push_back
using namespace std;
 
int give_me_answer(vector<int> values){
    int answer = 0, sum = 0, new_sum = 0;
    vector<int>::iterator start = values.begin(), stop = values.begin();
    while(1){
        while(*start<0 && start < stop){++start;}
        sum = accumulate(start,stop,0);
        answer = max(answer,sum);
        if(stop == values.end()){
            if(start == stop){break;}
            ++start;
            sum = accumulate(start,stop,0);
            answer = max(answer,sum);
            continue;
        }
        ++stop;
        new_sum = accumulate(start,stop,0);
        /* cout<<"start: "<<*start<<" & "<<"stop: "<<*stop<<" & ";
        cout<<"sum: "<<sum<<" & ";
        cout<<"new_sum: "<<new_sum<<"\n"; */
        if(new_sum < sum && new_sum < 0){++start;}
    }
    return answer;
}
 
int main(){
    int n,i,x;
    cin>>n;
    vector<int> values;
    FOR(i,0,n){
        cin>>x;
        values.pb(x);
    }
    cout<<give_me_answer(values);
    return 0;
}