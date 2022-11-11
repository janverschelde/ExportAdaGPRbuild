import ctypes
from os import getcwd
p = getcwd()
d = ctypes.WinDLL(p + "\\hellofun.dll")
d.hellofun()
