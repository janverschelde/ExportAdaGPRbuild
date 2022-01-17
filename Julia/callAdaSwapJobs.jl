"""
This Julia program illustrates the application of ccall()
to the characters in a string, via an Ada interface procedure.

In this second type of interface, the Julia program is in control.

The library libdemo is made with the Library_Auto_Init flag
set to true, so the adainit should not be called.
"""

LIBRARY = "../Ada/lib/libdemo"

word = [Cint('h'), Cint('e'), Cint('l'), Cint('l'), Cint('o')]
println(word)
ptr2word = pointer(word,1)
# p = ccall((:demoinit, LIBRARY), Cvoid, ())
p = ccall((:_ada_call_swap, LIBRARY), Cint,
           (Cint, Cint, Ref{Cint}, Cint), 0, 5, ptr2word, 1)
p = ccall((:_ada_call_swap, LIBRARY), Cint,
           (Cint, Cint, Ref{Cint}, Cint), 1, 5, ptr2word, 1)
p = ccall((:_ada_call_swap, LIBRARY), Cint,
           (Cint, Cint, Ref{Cint}, Cint), 2, 5, ptr2word, 1)
println(word)
# p = ccall((:demofinal, LIBRARY), Cvoid, ())
