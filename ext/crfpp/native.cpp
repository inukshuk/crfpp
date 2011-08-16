#include <native.hpp>

static VALUE learn(VALUE klass, VALUE arguments) {
	int result = -1, argc = 0;
	char **ap, *argv[18], *input, *tmp;
	
	Check_Type(arguments, T_STRING);
	tmp = StringValueCStr(arguments);
	
	// allocate space for argument vector
	input = (char*)malloc(strlen(tmp) + 12);
	
	// prepend command name
	strncpy(input, "crfpp-ruby ", 12);
	strncat(input, tmp, strlen(input) - 12);
	
	// remember allocation pointer
	tmp = input;
	
	// turn input string into argument vector (using
	// only the first seventeen tokens from input)
	for (ap = argv; (*ap = strsep(&input, " \t")) != (char*)0; ++argc) {
		if ((**ap != '\0') && (++ap >= &argv[18])) break;
	}
	
	// start training
	result = crfpp_learn(argc, argv) >= 0 ? Qtrue : Qfalse;
	
	// free allocated memory
	free(tmp);
	
	return result;
}

extern "C" void Init_native() {
	VALUE crfpp = rb_const_get(rb_mKernel, rb_intern("CRFPP"));
	VALUE native = rb_define_module_under(crfpp, "Native");
	
	rb_define_singleton_method(native, "learn",  VFUNC(learn), 1);
	
	Init_tagger(crfpp);
	
	rb_define_const(native, "VERSION", rb_str_new_cstr("0.54"));  
}
