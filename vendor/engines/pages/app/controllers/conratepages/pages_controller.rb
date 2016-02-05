
module Conratepages
  class PagesController < ApplicationController
    include Flip::ControllerFilters
    require_feature :conrate_pages

    helper Btemplater::ApplicationHelper
    helper Btemplater::IndexHelper
    helper Btemplater::ShowHelper
    helper Btemplater::NewHelper
    helper Btemplater::EditHelper
    include Btemplater::Tools

    def show
      # TODO: auth?
      @obj = Conratepages::Page.find(params[:id])
    end

    def new
      @obj = Conratepages::Page.new
    end

    def create
      do_create(params, Conratepages::Page, main_app.home_path)
    end

    def edit
      @obj = Conratepages::Page.find(params[:id])
    end

    def update
      do_update(params, Conratepages::Page)
    end

    def destroy
      do_destroy(params, Conratepages::Page, main_app.home_path)
    end

    def listformenu
      authorize Conratepages::Page, :listformenu?
      @pages = PagePolicy::Scope.new(current_user, Conratepages::Page).listformenu

      respond_to do |format|
        format.json { render json: ['Conratepages::Page', @pages.map{|w| {id: w.id, title: w.title}}]}
      end
    end
  end
end
