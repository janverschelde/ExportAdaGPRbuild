The make demomod.so executes the 
python3 setup.py build_ext
and then copies the shared object into demomod.so.

In a Python session, do
from demomod import py2c_hello as hello
hello()
