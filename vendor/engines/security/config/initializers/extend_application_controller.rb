Rails.application.config.to_prepare do
  ::ApplicationController.class_eval do
    include Pundit
    before_action :configure_permitted_parameters, if: :devise_controller?

    # after_action :verify_policy_scoped

    def ensure_signup_complete
      # Ensure we don't go into an infinite loop
      return if action_name == 'finish_signup'

      # Redirect to the 'finish_signup' page if the user
      # email hasn't been verified yet
      if current_user && !current_user.email_verified?
        redirect_to finish_signup_path(current_user)
      end
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:firstname, :secondname, :thirdname, :thirdname, :email, :password, :password_confirmation, :current_password, :mobile, addresses_attributes: [:id, :addresstype, :country, :zip, :city, :publicplace, :publicplace_type, :number, :other, :_destroy]) }
    end
  end
end
