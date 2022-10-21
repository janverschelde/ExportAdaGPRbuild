/* This file contains the prototypes for the python interface module. */

void initialize ( void );
/*
 * DESCRIPTION :
 *   Calls adainit(), initializing the interface to the Ada code,
 *   setting the initialized flag to one and the finalized flag to zero,
 *   if the initialized flag was zero.
 *   Nothing happens if the initialized flag equals one. */

void finalize ( void );
/*
 * DESCRIPTION :
 *   Calls adafinal(), finalizing the interface to the Ada code,
 *   setting the finalized flag to one and the initialized flag to zero,
 *   if the finalized flag was zero.
 *   Nothing happens if the finalized flag equals one. */

static PyObject *py2c_hello ( PyObject *self, PyObject *args );
/*
 * DESCRIPTION :
 *   Interface to the hello world. */
