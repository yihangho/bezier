require 'rake/testtask'
require 'yard'
require 'yard-tomdoc'

task default: [:test]

Rake::TestTask.new(:test) do |test|
  test.libs << 'test'
  test.pattern = 'test/test_*.rb'
  test.verbose = true
end

YARD::Rake::YardocTask.new do |t|
  t.options = ['--plugin', 'tomdoc']
end
