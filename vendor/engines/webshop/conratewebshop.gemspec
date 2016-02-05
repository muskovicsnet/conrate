$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'conratewebshop/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'conratewebshop'
  s.version     = Conratewebshop::VERSION
  s.authors     = ['egivandor']
  s.email       = ['egivandor82@gmail.com']
  s.homepage    = 'http://muskovics.net'
  s.summary     = 'Webshop.'
  s.description = 'Categories and products.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'rails', '~> 4.2.4'
  s.add_dependency 'carrierwave'
  s.add_dependency 'kaminari'
  s.add_dependency 'awesome_nested_set'
  s.add_dependency 'social-share-button'
  s.add_dependency 'dentaku'

  s.add_development_dependency 'sqlite3'
end
