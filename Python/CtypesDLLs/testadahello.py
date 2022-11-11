import ctypes
from os import getcwd
p = getcwd()
d = ctypes.WinDLL(p + "\\helloadafun.dll")
d.helloadafun()
