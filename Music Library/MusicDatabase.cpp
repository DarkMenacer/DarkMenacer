#include <iostream>
#include <string>
using namespace std;

class Song {
    public:
        string name;
        string artist;
        string album;
        int rating;
        //To change definition of Masterpiece
        bool masterpiece(){
            if (rating >= 8){
                return true;
            }
            return false;
        }
};

int main(){

    return 0;
}