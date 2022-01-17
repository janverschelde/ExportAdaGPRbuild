with text_io;                           use text_io;
with Ada.Strings.Unbounded;             use Ada.Strings.Unbounded;
with Swap;
with call_swap; -- to force compilation ...

procedure main is

  word : unbounded_string;

begin
  put("Give a word : ");
  word := to_unbounded_string(get_line);
  put_line("Your word is '" & to_string(word) & "'.");
  Swap.Initialize(word);
  Swap.DoIt;
  put_line("Swap word is '" & to_string(Swap.Retrieve) & "'.");
end main;
