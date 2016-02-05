$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "conrateaddressable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "conrateaddressable"
  s.version     = Conrateaddressable::VERSION
  s.authors     = ['egivandor']
  s.email       = ['egivandor82@gmail.com']
  s.homepage    = "http://muskovics.net"
  s.summary     = "Addresses."
  s.description = "User address for example."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.5"

  s.add_development_dependency "sqlite3"
end
