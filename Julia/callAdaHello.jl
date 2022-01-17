"""
This Julia program illustrates the application of ccall()
to call the Hello World! as defined by an Ada procedure.
The library libdemo is made with the Library_Auto_Init flag
set to true, so the adainit should not be called.
"""

LIBRARY = "../Ada/lib/libdemo"

# p = ccall((:adainit, LIBRARY), Cvoid, ())
p = ccall((:_ada_hello_world, LIBRARY), Cvoid, ())
# p = ccall((:adafinal, LIBRARY), Cvoid, ())
