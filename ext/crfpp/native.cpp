#include <native.hpp>

static VALUE learn(VALUE klass) {
	return rb_str_new2("learn");
}

extern "C" void Init_native() {
	VALUE crfpp = rb_const_get(rb_mKernel, rb_intern("CRFPP"));
	VALUE native = rb_define_module_under(crfpp, "Native");
	
	rb_define_singleton_method(native, "learn",  VFUNC(learn), 0);
	
	Init_tagger(crfpp);
}
