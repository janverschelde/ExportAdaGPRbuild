"""
This Julia program illustrates the application of ccall()
to call the main Ada procedure to swap the characters in a string.

In this first type of interface, the Ada procedure is in control.
It is the Ada procedure that prompts for a word, that swaps the
characters, and then outputs the swapped word.

The library libdemo is made with the Library_Auto_Init flag
set to true, so the adainit should not be called.
"""

LIBRARY = "../Ada/lib/libdemo"

# p = ccall((:demoinit, LIBRARY), Cvoid, ())
p = ccall((:_ada_main, LIBRARY), Cvoid, ())
# p = ccall((:demofinal, LIBRARY), Cvoid, ())
