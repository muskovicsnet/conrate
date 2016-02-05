$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'conrate_flip/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'conrate_flip'
  s.version     = ConrateFlip::VERSION
  s.authors     = ['egivandor']
  s.email       = ['egivandor82@gmail.com']
  s.homepage    = 'http://muskovics.net'
  s.summary     = 'Conrate features.'
  s.description = 'Enable or disable conrate features.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'rails', '~> 4.2.4'
  # Enable/disable features
  s.add_dependency 'flip'

  # s.add_development_dependency 'sqlite3'
end
