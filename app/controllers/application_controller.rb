class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # TODO: remove
  before_filter :set_locale
  def set_locale
    I18n.locale = :hu
  end

  # TODO: remove

  before_filter :set_cart
  def set_cart
    @cart ||= current_cart
  end

  private

  def current_cart
    Conratewebshop::Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Conratewebshop::Cart.create(user_id: current_user.try(:id))
    cart.save!
    session[:cart_id] = cart.id
    cart
  end

  private

  # TODO: move to security
  def user_not_authorized
    flash[:alert] = I18n.t('not_authorized')
    redirect_to(request.referrer || main_app.home_path)
  end
end
