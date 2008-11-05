require 'rake'
require 'rake/testtask'
require 'date'
require 'rake/gempackagetask'
require 'spec/rake/spectask'

test_files_pattern = 'test/rails_root/test/{unit,functional,other}/**/*_test.rb'
namespace :test do
  Rake::TestTask.new(:all => 'generator:tests') do |t|
    t.libs << 'lib'
    t.pattern = test_files_pattern
    t.verbose = false
  end

  desc "Run all specs in spec directory (excluding plugin specs)"
  Spec::Rake::SpecTask.new(:spec) do |t|
    t.spec_opts = ['--options', "\"test/rails_root/spec/spec.opts\""]
    t.spec_files = FileList['test/rails_root/spec/**/*_spec.rb']
  end
end

desc "Run the test suite"
task :default => ['test:all', 'test:spec']

spec = Gem::Specification.new do |s|
  s.name = "clearance"
  s.summary = "Fork of clearance, not-purely-restful, but with Facebook goodness"
  s.email = "info@hashrocket.com"
  s.version = '0.4.0'
  s.homepage = "http://github.com/hashrocket/clearance"
  s.description = "Fork of clearance, not-purely-restful, but with Facebook goodness"
  s.authors = [
    "thoughtbot, inc.",
    "Dan Croak",
    "Josh Nichols",
    "Jason Morrison",
    "Mike Burns",
    "Mike Breen",
    "Hashrocket, Inc.",
    "Les Hill",
    "Jon Larkowski",
    "Wes Gibbs"
  ]
  s.files = FileList["[A-Z]*", "{generators,lib,test}/**/*"]
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_zip = true
  pkg.need_tar = true
end

namespace :generator do
  desc "Run the generator on the tests"
  task :tests do
    system "mkdir -p test/rails_root/vendor/plugins/clearance"
    system "cp -R generators test/rails_root/vendor/plugins/clearance"
    system "cd test/rails_root; ./script/generate clearance"
  end
end
