# coding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'git-issues'

spec = Gem::Specification.new do |s|
  s.name = 'git-issues'
  s.licenses = ['MPLv2']
  s.version = GitIssues.new.version
  s.platform = Gem::Platform::RUBY
  s.summary = "manage git issues in cli"
  s.description = s.summary
  s.author = "Dominik Richter"
  s.email = "dominik.richter@googlemail.com"
  #s.homepage = 'n/a'

  s.add_dependency 'thor'
  s.add_dependency 'bitbucket_rest_api'
  s.add_dependency 'parseconfig'

  s.files = `git ls-files`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
