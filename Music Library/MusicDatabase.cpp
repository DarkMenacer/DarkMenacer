#include <iostream>
#include <string>
using namespace std;

class Song {
    private:
        int rating;
    public:
        string name;
        string artist;
        string album;
        bool masterpiece(){     //To change definition of Masterpiece
            if (rating >= 8){
                return true;
            }
            return false;
        }
};

void choice(){
    cout<<"\nMENU\n";
    cout<<"Press 1 to register a new entry\n";
    cout<<"Press 2 to view existing entries\n";
    cout<<"Press 3 to change existing entries\n";
    cout<<"Press 4 to exit the program\n";
    int x;
    cin>>x;
    switch (x) {
        case 1:
            break;
        case 4:
            exit(0);
            break;
        default:
            cout<<"INVALID CHOICE";
            choice();
    }

}


int main(){
    choice();
    return 0;
}