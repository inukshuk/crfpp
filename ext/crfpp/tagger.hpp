#ifndef RUBY_CRFPP_TAGGER
#define RUBY_CRFPP_TAGGER

#include <native.hpp>

extern "C" void Init_tagger();

extern "C" VALUE tagger_initialize(VALUE self);

#endif