$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "conrategalleries/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "conrategalleries"
  s.version     = Conrategalleries::VERSION
  s.authors     = ['egivandor']
  s.email       = ['egivandor82@gmail.com']
  s.homepage    = "http://muskovics.net"
  s.summary     = "Galleries."
  s.description = "Upload pictures to a gallery."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.4"
  s.add_dependency "hermitage"
  s.add_dependency 'carrierwave'
  s.add_dependency 'rmagick'
  s.add_dependency 'best_in_place'
  s.add_dependency 'jquery-fileupload-rails'

  # s.add_development_dependency "sqlite3"
end
