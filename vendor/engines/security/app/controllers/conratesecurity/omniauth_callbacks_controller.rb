module Conratesecurity
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def self.has_feature?
      begin
        return !Flip.conrate_security_facebook?
      # rescue ActiveRecord::StatementInvalid => e
      rescue Exception => e
        puts e
      ensure
        return false
      end
    end
    def self.provides_callback_for(provider)
      return '' if provider == :facebook && OmniauthCallbacksController.has_feature?
      class_eval %Q{
        def #{provider}
          @user = ::Conratesecurity::User.find_for_oauth(env["omniauth.auth"], current_user)

          if @user.persisted?
            sign_in_and_redirect @user, event: :authentication
            set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
          else
            session["devise.#{provider}_data"] = env["omniauth.auth"]
            redirect_to conratesecurity.new_user_registration_url
          end
        end
      }
    end

    [:facebook].each do |provider|
      provides_callback_for provider
    end

    def after_sign_in_path_for(resource)
      if resource.email_verified?
        super resource
      else
        conratesecurity.finish_signup_path(resource)
      end
    end
  end
end
