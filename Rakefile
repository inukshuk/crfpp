lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'rake/clean'
require 'rake/testtask'
require 'rake/extensiontask'

require 'crfpp/version'

task :default => [:test]

Rake::ExtensionTask.new do |ext|
  ext.name = 'native'
  
  ext.ext_dir = 'ext/crfpp'
  ext.lib_dir = 'lib/crfpp'
  
  CLEAN.include("#{ext.lib_dir}/native.*")
  CLEAN.include("#{ext.tmp_dir}")  
  
end

Rake::TestTask.new :test => [:compile] do |test|
  test.libs << 'test'
  test.test_files = Dir['test/**/test_*.rb']
  test.verbose = true
end

