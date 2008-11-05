Gem::Specification.new do |s|
  s.date = %q{2008-11-04}
  
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
  
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.files = Dir["[A-Z]*"] + Dir["{generators,lib,test}/**/*"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.2.0}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2
  end
end
