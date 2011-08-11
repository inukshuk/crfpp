
require 'rake/testtask'
require 'rake/extensiontask'

task :default => [:test]

Rake::ExtensionTask.new :crfpp

Rake::TestTask.new :test => [:compile] do |test|
  test.libs << 'test'
  test.test_files = Dir['test/**/test_*.rb']
  test.verbose = true
end
