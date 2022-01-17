#include <iostream>
#include "swap.h"

using namespace std;

int main()
{
   string word;

   cout << "Give a word : ";
   cin >> word;
   cout << "Your word is '" << word << "'." << endl;

   Swap swp(word);
   swp.DoIt();
   cout << "Swap word is '" << swp.Retrieve() << "'." << endl;

   return 0;
}
