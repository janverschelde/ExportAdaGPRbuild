This folder contains examples of the ccall(),
to call code in C++ or Ada from a Julia main program.

  file name      |                    description
-----------------+--------------------------------------------------------
callCppHello     | calls "Hello World!" defined by a C++ program
callAdaHello     | calls "Hello World!" defined by an Ada program
-----------------+--------------------------------------------------------
callCppSwap      | calls the main C++ to swap characters in a word
callAdaSwapMain  | calls the main Ada to swap characters in a word
callAdaSwapJobs  | calls the Ada interface procedure to swap characters

All Julia code was tested with version 1.7.1 of Julia.

To execute any of the programs in program.jl,
type "julia program.jl" at the command prompt.
