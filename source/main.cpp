#include <fstream>
#include <iostream>
#include <cstring>
#include <sstream>
#include <filesystem>

using namespace std;

void eraseFileLine(std::string path, std::string eraseLine) {
    std::string line;
    std::ifstream fin;
    
    fin.open(path);
    // contents of path must be copied to a temp file then
    // renamed back to the path file
    std::ofstream temp;
    temp.open("/var/lib/dpm/tmp.txt");

    while (getline(fin, line)) {
        // write all lines to temp other than the line marked for erasing
        if (line != eraseLine)
            temp << line << std::endl;
    }

    temp.close();
    fin.close();

    // required conversion for remove and rename functions
    //remove("/var/lib/dpm/tmp.txt");
    //std::filesystem::rename("/var/lib/dpm/tmp.txt", "/var/lib/dpm/installedpkg.txt");
}

int main(int argc, char **argv) {
    unsigned int cur_line = 0;
    ifstream file;
    file.open("/var/lib/dpm/installedpkg.txt");
    string line;
    string deleteline = argv[1];
    while(getline(file, line)) {
        cur_line++;
        if (line.find(deleteline, 0) != string::npos) {
            cout << "found" << endl;
            eraseFileLine("/var/lib/dpm/installedpkg.txt", argv[1]);
        }
    }
}