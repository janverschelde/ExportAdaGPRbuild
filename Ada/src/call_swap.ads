with C_Integer_Arrays;                  use C_Integer_Arrays;

function call_swap ( jobnbr : integer;
                     sizedata : integer;
                     swapdata : C_intarrs.Pointer;
                     verbose : integer ) return integer;

-- DESCRIPTION :
--   Calls the interface to the Swap package.
