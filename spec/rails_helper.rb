# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

Capybara.javascript_driver = :webkit
Capybara::Webkit.configure do |config|
  #config.allow_url("http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&lang=en")
  #config.allow_url("fonts.googleapis.com")
  config.block_unknown_urls
end

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  config.include Devise::TestHelpers, type: :controller
  config.include Devise::TestHelpers, type: :view
  config.extend ControllerMacros, type: :controller
  config.extend ControllerMacros, type: :view
  config.extend RequestMacros, type: :request
  config.extend FeatureMacros, type: :feature

  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  facebook_hash =
  {
    'provider' => 'facebook',
    'uid' => '123545',
    'user_info' => {
      'name' => 'fmockuser',
      'image' => 'fmock_user_thumbnail_url'
    },
    'credentials' => {
      'token' => 'fmock_token',
      'secret' => 'fmock_secret'
    },
    'extra' => {
      'raw_info' => {
        'name' => 'fMock User'
      }
    }
  }
  google_oauth2_hash =
  {
    'provider' => 'google_oauth2',
    'uid' => '123545',
    'user_info' => {
      'name' => 'gmockuser',
      'image' => 'gmock_user_thumbnail_url'
    },
    'credentials' => {
      'token' => 'gmock_token',
      'secret' => 'gmock_secret'
    },
    'extra' => {
      'raw_info' => {
        'name' => 'gMock User'
      }
    }
  }
  twitter_hash =
  {
    'provider' => 'twitter',
    'uid' => '123545',
    'user_info' => {
      'name' => 'tmockuser',
      'image' => 'tmock_user_thumbnail_url'
    },
    'credentials' => {
      'token' => 'tmock_token',
      'secret' => 'tmock_secret'
    },
    'extra' => {
      'raw_info' => {
        'name' => 'tMock User'
      }
    }
  }
  OmniAuth.config.add_mock(:facebook, facebook_hash)
  OmniAuth.config.add_mock(:google_oauth2, google_oauth2_hash)
  OmniAuth.config.add_mock(:twitter, twitter_hash)
end
Capybara.default_max_wait_time = 55
