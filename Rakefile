#!/usr/bin/env rake

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.test_files = FileList['./**/*_spec.rb']
  test.verbose = false
  test.warning = false
end

task default: %i[test]
