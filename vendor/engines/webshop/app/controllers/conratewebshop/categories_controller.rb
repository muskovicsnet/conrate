module Conratewebshop
  class CategoriesController < ApplicationController
    include Flip::ControllerFilters
    require_feature :conrate_webshop

    helper Btemplater::ApplicationHelper
    helper Btemplater::IndexHelper
    helper Btemplater::ShowHelper
    helper Btemplater::NewHelper
    helper Btemplater::EditHelper
    include Btemplater::Tools

    def show
      @obj = Conratewebshop::Category.find(params[:id])
      @products = @obj.products.order(:name).page params[:page]
    end

    def new
      @obj = Conratewebshop::Category.new
    end

    def create
      do_create(params, Conratewebshop::Category, main_app.home_path)
      ::Conratewebshop::Category.rebuild!
    end

    def edit
      @obj = Conratewebshop::Category.find(params[:id])
    end

    def update
      do_update(params, Conratewebshop::Category)
      ::Conratewebshop::Category.rebuild!
    end

    def destroy
      do_destroy(params, Conratewebshop::Category, main_app.home_path)
      Conratewebshop::Category.rebuild!
    end

    def listformenu
      authorize Conratewebshop::Category, :listformenu?
      @categories = CategoryPolicy::Scope.new(current_user, Conratewebshop::Category).listformenu

      respond_to do |format|
        format.json { render json: ['Conratewebshop::Category', @categories.map{|w| {id: w.id, title: w.name}}]}
      end
    end
  end
end
