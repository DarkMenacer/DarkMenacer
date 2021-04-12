#include <iostream>
#include <string>
using namespace std;

class Songs{
    private:
        int rating;
    public:
        string name;
        string artist;
        string album;

        Songs(string s_name,string s_album,string s_artist){
            name = s_name;album = s_album;artist = s_artist;
        }

        void setrating(int s_rating){
            if(s_rating<0||s_rating>10){
                cout<<"INVALID INPUT\nEnter a value between 1-10 only\n";
                rating = 0;
            }
            else{
                rating = s_rating;
            }
        }
        /*string getrating(){
            return rating;
        }*/

};

void display_song(Songs song){
    cout<<"Name: "<<song.name<<endl;
    cout<<"Album: "<<song.album<<endl;
    cout<<"Artist: "<<song.artist<<endl;
    //cout<<"Rated:"<<song.getrating()<<endl;
}

void AddSong();

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
            AddSong();
            choice();
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

void AddSong(){
    string song_name, song_album, song_artist;
    int song_rating;
    cout<<"Enter the name, album & artist of the song\n";
    cin.ignore();
    getline(cin,song_name);getline(cin,song_album);getline(cin,song_artist);
    Songs song_1(song_name, song_album, song_artist); //Modify later so that it can take in more songs
    cout<<"\nEnter the rating from 1-10\n";
    cin>>song_rating;
    song_1.setrating(song_rating);
    cout<<"Entry Added\n";
    display_song(song_1);
    choice();
}