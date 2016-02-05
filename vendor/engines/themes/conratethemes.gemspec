$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'conratethemes/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'conratethemes'
  s.version     = Conratethemes::VERSION
  s.authors     = ['egivandor']
  s.email       = ['egivandor82@gmail.com']
  s.homepage    = 'http://muskovics.net'
  s.summary     = 'Theme support.'
  s.description = 'Bootstrap and multiple theme support.'
  s.license     = 'MIT'

  s.files = Dir[
    '{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc'
  ]
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.2.4'
  s.add_dependency 'bootstrap-sass', '~> 3.3.5'
  s.add_dependency 'themes_on_rails'
  s.add_dependency 'font-awesome-rails'
  s.add_dependency 'meta-tags'
  s.add_dependency 'navigator'
  s.add_dependency 'cocoon'
  # s.add_dependency 'conratesettings'
  # EU cookie law
  s.add_dependency 'cookies_eu'
  s.add_development_dependency 'pg'
end
