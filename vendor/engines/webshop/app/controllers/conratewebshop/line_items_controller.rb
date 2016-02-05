module Conratewebshop
  class LineItemsController < ApplicationController
    # include Flip::ControllerFilters
    # require_feature :conrate_webshop

    # helper Btemplater::ApplicationHelper
    # helper Btemplater::IndexHelper
    # helper Btemplater::ShowHelper
    # helper Btemplater::NewHelper
    # helper Btemplater::EditHelper
    # include Btemplater::Tools

    # def show
    #   @obj = Conratewebshop::Category.find(params[:id])
    #   @products = @obj.products.order(:name).page params[:page]
    # end

    # def new
    #   @obj = Conratewebshop::Category.new
    # end

    def create
      # TODO: auth
    #   do_create(params, Conratewebshop::Category, main_app.home_path)
      @cart = current_cart
      product = Product.find(params[:product_id])
      @line_item = @cart.add_product(product.id)
      respond_to do |format|
        if @line_item.save
          format.html { redirect_to :back, notice: t('conratewebshop.carts.cart.product_added') }
          format.js { @current_item = @line_item }
          format.json { render json: @line_item,
            status: :created, location: @line_item }
        else
          format.html { render action: "new" }
          format.json { render json: @line_item.errors, status: :unprocessable_entity }
        end
      end
    end

    # def edit
    #   @obj = Conratewebshop::Category.find(params[:id])
    # end

    # def update
    #   do_update(params, Conratewebshop::Category)
    # end

    # def destroy
    #   do_destroy(params, Conratewebshop::Category, main_app.home_path)
    # end
  end
end
