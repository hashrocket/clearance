require 'rake'
require 'rake/testtask'
require 'date'
require 'rake/gempackagetask'

test_files_pattern = 'test/rails_root/test/{unit,functional,other}/**/*_test.rb'
namespace :test do
  Rake::TestTask.new(:all => 'generator:tests') do |t|
    t.libs << 'lib'
    t.pattern = test_files_pattern
    t.verbose = false
  end
end

desc "Run the test suite"
task :default => 'test:all'

spec = Gem::Specification.new do |s|
  s.name = "npr-clearance"
  s.summary = "Fork of clearance, not-purely-restful"
  s.email = "les@hashrocket.com"
  s.version = '0.1'
  s.homepage = "http://github.com/leshill/clearance"
  s.description = "Fork of clearance, not-purely-restful"
  s.authors = ["thoughtbot, inc.", "Dan Croak", "Josh Nichols", "Jason Morrison", "Mike Burns", "Mike Breen", "Les Hill"]
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
