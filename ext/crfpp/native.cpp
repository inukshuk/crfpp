#include <ruby.h>


VALUE hello_world(VALUE klass) {
	return rb_str_new2("hello world");
}

extern "C" void Init_native(void) {
	VALUE mCRFPP = rb_define_module("CRFPP");
	VALUE mNative = rb_define_module_under(mCRFPP, "Native");
	
	rb_define_singleton_method(mNative, "hello_world",  ((VALUE (*)(ANYARGS)) hello_world), 0);
}
