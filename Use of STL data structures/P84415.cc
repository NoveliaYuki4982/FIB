//P84415 - Bag of words
#include <iostream>
#include <map>
using namespace std;

int main() {
    string op;
    map<string,int> bag;
    while (cin >> op) {
        if (op == "store") {
            string w;
            cin >> w;
            auto it = bag.find(w);
            if (it == bag.end()) bag.insert(pair<string,int>(w,1));
            else ++bag[w];
        }
        
        else if (op == "delete") {
            string w;
            cin >> w;
            auto it = bag.find(w);
            if (it != bag.end()) {
                --bag[w];
                if (bag[w] == 0) bag.erase(w);
            }
        }
        
        else if (op == "minimum?") {
            if (bag.empty()) cout << "indefinite minimum" << endl;
            else {
                auto it = bag.begin();
                cout << "minimum: " << (*it).first << ", " << (*it).second << " time(s)" << endl;
            }
        }
        
        else if (op == "maximum?") {
            if (bag.empty()) cout << "indefinite maximum" << endl;
            else {
                auto it = bag.end();
                --it;
                cout << "maximum: " << (*it).first << ", " << (*it).second << " time(s)" << endl;
            }
        }
    }
}
