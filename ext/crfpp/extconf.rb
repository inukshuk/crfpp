ENV['RC_ARCHS'] = '' if RUBY_PLATFORM =~ /darwin/

require 'mkmf'

HEADER_DIRS = %W{
  /usr/local/include #{Config::CONFIG['includedir']} /usr/include
}

LIB_DIRS = %W{
  /usr/local/lib #{Config::CONFIG['libdir']} /usr/lib
}

dir_config('crfpp', HEADER_DIRS, LIB_DIRS)


find_header('crfpp.h') || abort('crfpp.h not found')
find_library('crfpp', 'crfpp_xsize') || abort('library crfpp not found')

create_makefile('crfpp/native')
