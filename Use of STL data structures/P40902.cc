//P40902 - Casino
#include <iostream>
#include <map>
using namespace std;

int main() {
    map<string,int> people;
    string name, op;
    while (cin >> name >> op) {
        
        if (people.find(name) == people.end()) {
            if (op == "enters") people.insert(pair<string,int> (name, 0));
            else {
                if (op == "wins") {
                    int s;
                    cin >> s;
                }
                cout << name << " is not in the casino" << endl;
            }
        }
        
        else {
            if (op == "wins") {
                int s;
                cin >> s;
                people[name] += s;
            }
            else if (op == "leaves") {
                cout << name << " has won " << people[name] << endl;
                people.erase(name);
            }
            else if (op == "enters") cout << name << " is already in the casino" << endl;
        }
    }
    
    cout << "----------" << endl;
    if (not people.empty()) {
        for (auto it = people.begin(); it != people.end(); ++it) cout << (*it).first << " is winning " << (*it).second << endl;
    }
}
