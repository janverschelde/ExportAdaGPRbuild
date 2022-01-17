with Ada.Strings.Unbounded;             use Ada.Strings.Unbounded;

package body Swap is

  data : unbounded_string;

  procedure Initialize ( s : in unbounded_string ) is
  begin
    data := s;
  end Initialize;

  procedure DoIt is

    s : constant string := to_string(data);
    size : constant integer := s'last;
    result : string(1..size);

  begin
    for k in 1..size loop
      result(k) := s(size-k+1);
    end loop;
    data := to_unbounded_string(result);
  end DoIt;

  function Retrieve return unbounded_string is
  begin
    return data;
  end Retrieve;

end Swap;
