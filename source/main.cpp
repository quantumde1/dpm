#include <fstream>
#include <iostream>

using namespace std;

int main(int argc, char **argv) {
    unsigned int cur_line = 0;
    ifstream file;
    file.open("/var/lib/dpm/installedpkg.txt");
    string line;
    string deleteline = argv[1];
    string path = "/usr/bin/";
    string sec = path+deleteline;
    while(getline(file, line)) {
        cur_line++;
        if (line.find(deleteline, 0) != string::npos) {
            cout << "found" << endl;
        }
    }
}