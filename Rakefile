require 'rubygems'
require 'bundler/setup'
require 'rake/testtask'

# Immediately sync all stdout so that tools like buildbot can
# immediately load in the output.
$stdout.sync = true
$stderr.sync = true

# Change to the directory of this file.
Dir.chdir(File.expand_path("../", __FILE__))

# This installs the tasks that help with gem creation and
# publishing.
Bundler::GemHelper.install_tasks

Rake::TestTask.new do |t|
  t.libs << "test"
  t.pattern = "test/classes/*_spec.rb"
  t.verbose = true
end

task default: [:test]
