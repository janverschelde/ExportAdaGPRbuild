/* This file contains the definitions of the prototypes in demomod.h */

#include <Python.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "structmember.h"

// extern void adainit ( void );
extern "C" int _ada_hello_world ( void );
// extern void adafinal ( void );

int g_ada_initialized = 0;
int g_ada_finalized = 0;

void initialize ( void )
{
   if(!g_ada_initialized)
   {
      // adainit();
      g_ada_initialized = 1;
      g_ada_finalized = 0;
   }
}

void finalize ( void )
{
   if(!g_ada_finalized)
   {
      // adafinal();
      g_ada_finalized = 1;
      g_ada_initialized = 0;
   }
}

static PyObject *py2c_hello ( PyObject *self, PyObject *args )
{
   if(!PyArg_ParseTuple(args,"")) return NULL;   

   initialize();
   int fail = _ada_hello_world();

   return Py_BuildValue("i", fail);
}

static PyMethodDef demomod_methods[] = 
{
   {"py2c_hello", py2c_hello, METH_VARARGS,
    "Calls the Hello World! main function defined in Ada."},
   {NULL, NULL, 0, NULL} 
};

static struct PyModuleDef demomodmodule = {
   PyModuleDef_HEAD_INIT,
   "demomod",
   NULL, /* no module documentation */
   -1,
   demomod_methods
};

PyMODINIT_FUNC
PyInit_demomod(void)
{
   return PyModule_Create(&demomodmodule);
}
