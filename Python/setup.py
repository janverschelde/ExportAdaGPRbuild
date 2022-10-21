from distutils.core import setup, Extension

ADALIB = 'C:/GNAT/2021/lib/gcc/x86_64-w64-mingw32/10.3.1/adalib/'

winkitucrt='C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.18362.0\\ucrt'

includepath='C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Toools\\MSVC\\14.25.28610\\include'

MOD = 'demomod'
setup(name=MOD,ext_modules=[Extension(MOD, \
  sources=['demomod.cpp'], language = "c++", \
  include_dirs=[winkitucrt, includepath], \
  extra_objects=['../Ada/lib/libdemo.a', \
    ADALIB + 'libgnat_pic.a', ADALIB + 'libgnarl_pic.a'])])
