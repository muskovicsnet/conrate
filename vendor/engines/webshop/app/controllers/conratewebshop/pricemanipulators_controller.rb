module Conratewebshop
  class PricemanipulatorsController < ApplicationController
    include Flip::ControllerFilters
    require_feature :conrate_webshop

    helper Btemplater::ApplicationHelper
    helper Btemplater::IndexHelper
    helper Btemplater::ShowHelper
    helper Btemplater::NewHelper
    helper Btemplater::EditHelper
    include Btemplater::Tools

    def index
      @objects = Conratewebshop::Pricemanipulator.all.order('name asc').page(params[:page]).per 2
    end

    def show
      @obj = Conratewebshop::Pricemanipulator.find(params[:id])
    end

    def new
      @obj = Conratewebshop::Pricemanipulator.new
    end

    def create
      do_create(params, Conratewebshop::Pricemanipulator, conratewebshop.pricemanipulators_path)
    end

    def edit
      @obj = Conratewebshop::Pricemanipulator.find(params[:id])
    end

    def update
      do_update(params, Conratewebshop::Pricemanipulator)
    end

    def destroy
      do_destroy(params, Conratewebshop::Pricemanipulator, conratewebshop.pricemanipulators_path)
    end
  end
end
