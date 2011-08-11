# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'crfpp/version'

Gem::Specification.new do |s|
  s.name        = 'crfpp'
  s.version     = CRFPP::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Sylvester Keil']
  s.email       = ['http://sylvester.keil.or.at']
  s.homepage    = 'http://inukshuk.github.com/crfpp'
  s.summary     = 'Conditional Random Fields for Ruby.'
  s.description = 'A Ruby extension to interface with CRF++, the Conditional Random Fields library written in C++. You need to install libcrfpp to use this gem.'
  s.license     = 'FreeBSD'

  # s.add_runtime_dependency('citeproc', ['~>0.0'])
  # s.add_runtime_dependency('execjs', ['>=1.2.4', '<1.3.0'])

  s.add_development_dependency('rake', '~>0.9')
  s.add_development_dependency('rake-compiler', '~>0.7')
  # s.add_development_dependency('rspec', ['>=2.6.0'])
  # s.add_development_dependency('watchr', ['>=0.7'])

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables  = []
  s.require_path = 'lib'
  
  s.extensions << 'ext/crfpp/extconf.rb'

  s.rdoc_options      = %w{--line-numbers --inline-source --title "CRFPP" --main README.md --webcvs=http://github.com/inukshuk/crfpp/tree/master/}
  s.extra_rdoc_files  = %w{README.md}
  
end

# vim: syntax=ruby