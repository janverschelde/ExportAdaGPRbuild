#include <string>
#include "swap.h"

Swap::Swap ( std::string s )
{
   data = s;
}

void Swap::DoIt ( void )
{
   std::string result = data;

   const int size = data.size();

   for(int i=0; i<size; i++) result[i] = data[size-i-1];

   data = result;
}

std::string Swap::Retrieve ( void ) const
{
   return data;
}
