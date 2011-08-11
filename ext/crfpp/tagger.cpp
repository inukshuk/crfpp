#include <tagger.hpp>

static VALUE deallocate(CRFPP::Tagger *tagger) {
	delete tagger;
}

static VALUE allocate(VALUE self) {
	CRFPP::Tagger *tagger = CRFPP::createTagger("");
	return Data_Wrap_Struct(self, 0, deallocate, tagger);
}

void Init_tagger() {
	VALUE cTagger = rb_define_class_under(mCRFPP, "Tagger", rb_cObject);
	rb_define_alloc_func(cTagger, allocate);
	rb_define_method(cTagger, "initialize", VFUNC(tagger_initialize), 0);
}

VALUE tagger_initialize(VALUE self) {
	return self;
}
