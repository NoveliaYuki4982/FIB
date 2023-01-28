//P37064 - Dynamic median
#include <iostream>
#include <set>
using namespace std;

int main() {
    string w;
    cin >> w;
    if (w != "END") {
        set<string> s;
        s.insert(w);
        cout << w << endl;
        auto it = s.begin(), m = it;
        
        while (cin >> w and w != "END") {
            s.insert(w);
            if (w < *m and s.size()%2 == 0) --m;
            else if (w > *m and s.size()%2 != 0) ++m;
            cout << *m << endl;
        }
    }
}
