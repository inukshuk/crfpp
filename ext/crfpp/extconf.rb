ENV['RC_ARCHS'] = '' if RUBY_PLATFORM =~ /darwin/

require 'mkmf'

HEADER_DIRS = %W{
  /usr/local/include #{Config::CONFIG['includedir']} /usr/include
}

LIB_DIRS = %W{
  /usr/local/lib #{Config::CONFIG['libdir']} /usr/lib
}

dir_config('crfpp', HEADER_DIRS, LIB_DIRS)

crfpp_config = with_config('crfpp-config', 'crfpp-config')
use_crfpp_config = enable_config('crfpp-config')

find_header('crfpp.h') || abort('crfpp.h not found')

have_library('crfpp') || abort('library crfpp not found')
have_library('pthread')


create_makefile('crfpp/native')
