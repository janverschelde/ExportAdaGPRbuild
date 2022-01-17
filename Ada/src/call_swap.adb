with unchecked_conversion;
with Interfaces.C;
with text_io;
with Ada.Strings.Unbounded;             use Ada.Strings.Unbounded;
with Swap;

function call_swap ( jobnbr : integer;
                     sizedata : integer;
                     swapdata : C_intarrs.Pointer;
                     verbose : integer ) return integer is

  package integer_io is new text_io.integer_io(integer);

  subtype short_int is integer range 0..255;

  function short_int_to_character is new
    unchecked_conversion(short_int,character);

  function character_to_short_int is new
    unchecked_conversion(character,short_int);

  procedure Initialize is
  begin
    if verbose > 0 then
      text_io.put("-> extracting ");
      integer_io.put(sizedata,1);
      text_io.put_line(" characters into a string ...");
    end if;
    declare
      valdata : constant C_Integer_Array := C_intarrs.Value(swapdata);
      word : string(1..sizedata);
    begin
      for i in valdata'range loop
        exit when (integer(i) >= sizedata); 
        word(integer(i)+1) := short_int_to_character(short_int(valdata(i)));
      end loop;
      if verbose > 0
       then text_io.put_line("-> extracted '" & word & "'");
      end if;
      Swap.Initialize(to_unbounded_string(word));
    end;
  end Initialize;

  procedure DoSwap is
  begin
    if verbose > 0
     then text_io.put_line("-> performing the swap ...");
    end if;
    Swap.DoIt;
  end DoSwap;

  procedure Retrieve is
  begin
    if verbose > 0
     then text_io.put_line("-> retrieving the string ...");
    end if;
    declare
      word : constant string := to_string(Swap.Retrieve);
      sizeword : constant Interfaces.C.size_t
               := Interfaces.C.size_t(word'last-1);
      valdata : C_Integer_Array(0..sizeword);
      nbr : short_int;
    begin
      if verbose > 0
       then text_io.put_line("-> the string is '" & word & "'");
      end if;
      for i in valdata'range loop
        nbr := character_to_short_int(word(integer(i)+1));
        valdata(i) := Interfaces.C.int(nbr);
      end loop;
      C_intarrs.Copy_Array(valdata(0)'unchecked_access,swapdata,
                           Interfaces.C.ptrdiff_t(word'last));
    end;
  end Retrieve;

  procedure Main is
  begin
    if verbose > 0 then
      text_io.put("-> inside call_swap with jobnbr : ");
      integer_io.put(jobnbr,1);
      text_io.new_line;
    end if;
    case jobnbr is
      when 0 => Initialize;
      when 1 => DoSwap;
      when 2 => Retrieve;
      when others =>
        text_io.put("ERROR : ");
        integer_io.put(jobnbr,1);
        text_io.put_line(" is an invalid value for jobnbr!");
    end case;
    if verbose > 0
     then text_io.put_line("-> leaving call_swap");
    end if;
  end Main;

begin
  Main;
  return 0;
end call_swap;
