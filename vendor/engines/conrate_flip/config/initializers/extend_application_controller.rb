Rails.application.config.to_prepare do
  ::ApplicationController.class_eval do
    rescue_from Flip::Forbidden, with: :feature_forbidden

    private

    # TODO: move to conrate_flip
    def feature_forbidden
      flash[:alert] = I18n.t('feature_forbidden')
      redirect_to(request.referrer || main_app.home_path)
    end
  end
end
