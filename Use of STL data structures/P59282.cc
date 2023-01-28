//P59282 - Statistical measures
#include <iostream>
#include <map>
using namespace std;

int main() {
    cout.setf(ios::fixed);
    cout.precision(4);
    map<int,int> collection;
    string op;
    int s = 0, num = 0;
    while (cin >> op) {
        
        if (op == "number") {
            auto it = collection.begin();
            int n;
            cin >> n;
            s += n;
            ++num;
            
            it = collection.find(n);
            if (it == collection.end()) collection.insert(pair<int,int>(n,1));
            else ++collection[n];
        }
        
        else if (not collection.empty()) {
            --num;
            s -= collection.begin()->first;
            --collection.begin()->second;
            if (collection.begin()->second == 0) collection.erase(collection.begin());
        }
        
        if (num == 0) cout << "no elements" << endl;
        else cout << "minimum: " << collection.begin()->first << ", maximum: " << (--collection.end())->first << ", average: " << s/(double)num << endl;
    }
}
