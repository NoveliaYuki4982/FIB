//P69781 - Collatz pseudo-sequences (2)
#include <iostream> 
#include <map>
using namespace std;

int main() {
    int x, y, n;
    map<int,int> nums;
    while (cin >> x >> y >> n) {
        
        int cycles = 1;
        bool next = true;
        nums.insert(pair<int,int> (n, 0));
        
        while (next and n <= 100000000) {
            if (n%2 == 0) n = n/2 + x;
            else n = 3*n + y;
            auto it = nums.find(n);
            if (it == nums.end()) nums.insert(pair<int,int>(n,cycles));
            else {
                next = false;
                n = cycles - (*it).second;
            }
            ++cycles; 
        }
        cout << n << endl;
        nums.clear();
    }
}
