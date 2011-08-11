#ifndef RUBY_CRFPP
#define RUBY_CRFPP

#include <ruby.h>
#include <crfpp.h>

#define VFUNC(f) ((VALUE (*)(ANYARGS)) f)

extern VALUE mCRFPP;
extern VALUE mNative;

#endif