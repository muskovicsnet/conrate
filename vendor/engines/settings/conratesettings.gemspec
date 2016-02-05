$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'conratesettings/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'conratesettings'
  s.version     = Conratesettings::VERSION
  s.authors     = ['egivandor']
  s.email       = ['egivandor82@gmail.com']
  s.homepage    = 'http://muskovics.net'
  s.summary     = 'Settings management.'
  s.description = 'Settings support for Conrate.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'rails', '~> 4.2.4'
  s.add_dependency 'rails-settings-cached', '~> 0.4.0'

  s.add_development_dependency 'sqlite3'
end
