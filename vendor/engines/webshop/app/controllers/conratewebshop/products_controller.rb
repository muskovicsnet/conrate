module Conratewebshop
  class ProductsController < ApplicationController
    helper Btemplater::ApplicationHelper
    helper Btemplater::IndexHelper
    helper Btemplater::ShowHelper
    helper Btemplater::NewHelper
    helper Btemplater::EditHelper
    include Btemplater::Tools

    def show
      @obj = Conratewebshop::Product.find(params[:id])
    end

    def new
      @obj = Conratewebshop::Product.new
      @obj.category_id = params[:category_id]
    end

    def create
      do_create(params, Conratewebshop::Product, conratewebshop.category_path(params[:category_id]))
    end

    def edit
      @obj = Conratewebshop::Product.find(params[:id])
    end

    def update
      do_update(params, Conratewebshop::Product, conratewebshop.category_path(params[:category_id]))
    end

    # def before_save_create(obj)
    #   obj.category_id = params[:category_id]
    # end

    def destroy
      do_destroy(params, Conratewebshop::Product, conratewebshop.category_path(params[:category_id]))
    end
  end
end
