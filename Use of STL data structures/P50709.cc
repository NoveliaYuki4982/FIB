//P50709 - Collection of numbers
#include <iostream>
#include <queue>
using namespace std;

int main() {
    priority_queue<int> pq;
    char op;
    while (cin >> op) {
        if (op == 'S') {
            int x;
            cin >> x;
            pq.push(x);
        }
        
        else if (op == 'A') {
            if (pq.empty()) cout << "error!" << endl;
            else cout << pq.top() << endl;
        }
        
        else if (op == 'R') {
            if (pq.empty()) cout << "error!" << endl;
            else pq.pop();
        }
        
        else if (op == 'I') {
            if (pq.empty()) cout << "error!" << endl;
            else {
                int x;
                cin >> x;
                int s = pq.top() +x;
                pq.pop();
                pq.push(s);
            }
        }
        
        else if (op == 'D') {
            if (pq.empty()) cout << "error!" << endl;
            else {
                int x;
                cin >> x;
                int s = pq.top() -x;
                pq.pop();
                pq.push(s);
            }
        }
    }
}
