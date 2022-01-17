#include <stdio.h>
#include <string.h>
#include "call_swap.h"

#define length_of_line 80

int main ( int argc, char* argv )
{
   char word[length_of_line];
   int sizeword;
   int dataword[length_of_line];
   int fail;

   printf("Testing the C interface to the Swap package ...\n");

   printf("Give a word : "); scanf("%s", word);
   printf("Your word is '"); printf("%s'\n", word);

   sizeword = strlen(word);
   printf("The number of characters in the word : %d\n", sizeword);
   for(int idx = 0; idx < sizeword; idx++)
      dataword[idx] = (int) word[idx];

   adainit();
   fail = _ada_call_swap(0,sizeword,dataword,1);
   fail = _ada_call_swap(1,sizeword,dataword,1);
   fail = _ada_call_swap(2,sizeword,dataword,1);
   adafinal();

   for(int idx = 0; idx < sizeword; idx++)
      word[idx] = (char) dataword[idx];

   printf("Swap word is '"); printf("%s'\n", word);

   return 0;
}
