#include <native.hpp>
#include <tagger.hpp>

VALUE mCRFPP;
VALUE mNative;

static VALUE hello_world(VALUE klass) {
	return rb_str_new2("hello world");
}

extern "C" void Init_native() {
	mCRFPP = rb_define_module("CRFPP");
	mNative = rb_define_module_under(mCRFPP, "Native");
	
	rb_define_singleton_method(mNative, "hello_world",  VFUNC(hello_world), 0);
	
	Init_tagger();
}
