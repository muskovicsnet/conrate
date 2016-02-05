module Conratesecurity
  require 'devise'
#  require 'devise-async'
  require 'rolify'
  require 'pundit'
  require 'devise-bootstrap-views'
  require 'omniauth'
  require 'omniauth-facebook'

  class Engine < ::Rails::Engine
    isolate_namespace Conratesecurity

    middleware.use OmniAuth::Builder do
      provider :facebook, ENV['FACEBOOK_ID'], ENV['FACEBOOK_SECRET'], scope: 'user_about_me,email,public_profile,user_friends,user_likes,publish_actions,user_posts', info_fields: 'email,name,locale'
    end
  end
end
