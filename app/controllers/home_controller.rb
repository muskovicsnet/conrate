class HomeController < ApplicationController
  def index
    homepage = Settings['conratethemes.homepage']
    unless homepage.blank?
      redirect_to homepage
    end
  end
end
