module Conratesettings
  class SettingsController < ApplicationController
    helper Btemplater::ApplicationHelper
    helper Btemplater::IndexHelper
    helper Btemplater::ShowHelper
    helper Btemplater::NewHelper
    helper Btemplater::EditHelper
    include Btemplater::Tools

    def index
      # @objects = Conratesettings::Setting.all.order('id').page(params[:page])
      @objects = ::Settings.all.page(params[:page])
    end

    def show
      @obj = Settings.find(params[:id])
    end

    def edit
      @obj = ::Settings.find(params[:id])
    end

    def update
      authorize ::Settings, :update?

      setting = Settings.find_by_var(params[:settings][:var])
      setting.value = params[:settings][:value]
      setting.save
      redirect_to conratesettings.settings_path
    end

    def destroy
      do_destroy(params, ::Settings, conratesettings.settings_path)
    end
  end
end
