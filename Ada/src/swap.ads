with Ada.Strings.Unbounded;             use Ada.Strings.Unbounded;

package Swap is

-- Exports the inversion of the characters in a string.

  procedure Initialize ( s : in unbounded_string );

  -- Initializes the data attribute with s.

  procedure DoIt;

  -- Reverses the characters in the initialized string.

  function Retrieve return unbounded_string;

  -- Returns the data string.

end Swap;
