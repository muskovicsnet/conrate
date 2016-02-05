$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'conratesecurity/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'conratesecurity'
  s.version     = Conratesecurity::VERSION
  s.authors     = ['egivandor']
  s.email       = ['egivandor82@gmail.com']
  s.homepage    = 'http://muskovics.net'
  s.summary     = 'User sign in'
  s.description = 'User sign in, sign up.'
  s.license     = 'MIT'

  s.files = Dir[
    '{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc'
  ]
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.2.4'
  s.add_dependency 'devise'
#  s.add_dependency 'devise-async'
  s.add_dependency 'devise-bootstrap-views'
  s.add_dependency 'omniauth'
  s.add_dependency 'omniauth-facebook'
  s.add_dependency 'rolify'
  s.add_dependency 'pundit'

  s.add_development_dependency 'pg'
end
