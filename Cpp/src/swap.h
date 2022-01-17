#ifndef __class_swap_h__
#define __class_swap_h__

class Swap
{
   public:

      Swap ( std::string s );

      // Initializes the data attribute with s.

      void DoIt ( void );

      // Inverts the characters in the stored string.

      std::string Retrieve ( void ) const;

      // Returns the string.

   private:

      std::string data;

};

#endif
