$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "conratejobs/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "conratejobs"
  s.version     = Conratejobs::VERSION
  s.authors     = ['egivandor']
  s.email       = ['egivandor82@gmail.com']
  s.homepage    = "http://muskovics.net"
  s.summary     = "Running jobs asynchronously."
  s.description = "Running background jobs asynchronously."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.4"
  # Postgresql queue
  s.add_dependency "que"
  s.add_dependency "que-web"

  # s.add_development_dependency "sqlite3"
end
