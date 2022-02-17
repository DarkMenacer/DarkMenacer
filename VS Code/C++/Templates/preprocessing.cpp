//header files
#include <iostream>
#include <string>
#include <cmath>
#include <iomanip>
#include <vector>
#include <deque>
#include <list>
#include <set>   // set and multiset
#include <map>   // map and multimap
#include <unordered_set>  // unordered set/multiset
#include <unordered_map>  // unordered map/multimap
#include <iterator>
#include <algorithm>   // includes sort()
#include <numeric>    // some numeric algorithm
#include <functional>
#include <tuple>
#include <stack>
#include <queue>
using namespace std;

//Macros

//*) general purpose
#define FOR(i,start,upper_limit) for(i=start;i<upper_limit;++i)
#define pb push_back
#define all(name) name.begin(),name.end()

//*) debugging
#define here cout<<"here\n"
#define nl cout<<'\n'
#define display(name) for(auto it: name){cout<<it<<" ";}cout<<"\n"
#define what_is___here(name) cout<<"It is "<<name<<"\n"

//2) Pair
#define f first
#define s second
#define mp make_pair
#define p pair

//Whatever this is
#define fastIO ios_base::sync_with_stdio(0 && cin.tie(0) && cout.tie(0));
int32_t mod = 1e9 + 7;
void solve()
{/* Code here*/}

int32_t main()
{
    fastIO;
    solve();
    return 0;
}