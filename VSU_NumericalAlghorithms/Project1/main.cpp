#include <iostream>


using namespace std;


int main() {
    // ���� ������
    int a, b;
    //console out -> cout
    // <<
    cout << "Input two numbers a � b (-100 < a, b < 100): ";
    //console in 
    // >>
    cin >> a >> b;

    int prod = 1;
     for (int i = a; i <= b; ++i)//for i in range(a, b, 1)
         if (i * 6 % 10 == 2)
             prod *= i;
  
     cout << prod << "\n";

     return 0;
}