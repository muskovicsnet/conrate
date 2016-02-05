module Conratesecurity
  class RolesController < Conratesecurity::ApplicationController
    helper Btemplater::ApplicationHelper
    helper Btemplater::IndexHelper
    helper Btemplater::ShowHelper
    helper Btemplater::NewHelper
    include Btemplater::Tools

    def index
      @objects = Conratesecurity::Role.all.order('id').page(params[:page])
    end

    def show
      @obj = Conratesecurity::Role.find(params[:id])
    end

    def destroy
      @object = Conratesecurity::Role.find(params[:id])
      @object.destroy
      redirect_to conratesecurity.roles_path
    end
  end
end
