The code in this folder was made in preparation of a talk on
"Exporting Ada software to Python and Julia"
with subtitle 
"applying GPRbuild to make shared object files"
in the Ada devroom, at FOSDEM 2022, 6 February, online.

GPRbuild is the project manager of the gnu-ada compiler GNAT.

To demonstrate GPRbuild, consider a program that swaps the characters
in a string, represented as an array of ASCII codes (32-bit integers).
In a first interface, the Ada program remains in control.  
In the second interface, the control is passed to C functions,
called by a Julia program.

The file demo.gpr is an aggregate project, running
"gprbuild demo.gpr" 
builds the executable files defined
by the Ada code in the Ada/src folder and
by the C++ code in the Cpp/src folder.
The executable files are placed in the folders Ada/bin and Cpp/bin.

To remove all files built with the definitions in demo.gpr, use the
"gprclean demo.gpr"
command.

The file demolib.gpr is the corresponding aggregate project to
build the shared object files define by the sources in Ada and C++.

The shared object files are used by Julia programs in the Julia folder.
