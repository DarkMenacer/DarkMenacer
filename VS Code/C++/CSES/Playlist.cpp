/*
Name:-              Playlist
Platform:-          CSES
Date:-              24 January 2022
Type of Problem:-   Searching
Complexity:-
Status:- 

Solution in brief:

Sample to understand solution:
Input:-

Output:-

Explanation:-

*/

#include <iostream>
#include <vector>
#include <map>
#include <iterator>
#define FOR(i,start,upper_limit) for(i=start;i<upper_limit;++i)
#define pb push_back
#define all(name) name.begin(),name.end()
using namespace std;
 
int give_me_answer(vector<int> songs){
    int answer = 1, i = 0;
    map<int,int> unique;
    pair< map<int,int>::iterator , bool> ret;
    vector<int>::iterator itr = songs.begin();
    while(itr!=songs.end()){
        ret = unique.insert( make_pair(*itr,i) );
        if(ret.second == false || itr==songs.end()-1){
            int temp = unique.size();
            answer = max(answer, temp);
            i = unique.find(*itr)->second;
            itr = songs.begin() + i;
            unique.clear();
        }
        ++i;
        ++itr;
    }
    return answer;
}
 
int main(){
    int n,i,x;
    cin>>n;
    vector<int> songs;
    FOR(i,0,n){
        cin>>x;
        songs.pb(x);
    }
    cout<<give_me_answer(songs);
    return 0;
}