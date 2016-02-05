module Conratewebshop
  class OrdersController < ApplicationController
    include Flip::ControllerFilters
    require_feature :conrate_webshop

    helper Btemplater::ApplicationHelper
    helper Btemplater::IndexHelper
    helper Btemplater::ShowHelper
    # helper Btemplater::NewHelper
    # helper Btemplater::EditHelper
    include Btemplater::Tools

    def index
      @objects = Conratewebshop::Order.all.order('created_at desc').page(params[:page])
    end

    def show
      @obj = Conratewebshop::Order.find(params[:id])
    end

    def new
      @cart = current_cart
      if @cart.line_items.empty?
        redirect_to main_app.home_path, notice: t('conratewebshop.carts.cart.your_cart_is_empty')
      return
      end

      @order = Order.new

      # TODO: fill fields
      @order.firstname = current_user.firstname
      @order.secondname = current_user.secondname
      @order.thirdname = current_user.thirdname
      @order.mobile = current_user.mobile

      delivery_address = Conrateaddressable::Address.find_by(addresstype: Conrateaddressable::Address.addresstype.delivery.to_s, user_id: current_user.try(:id))
      billing_address = Conrateaddressable::Address.find_by(addresstype: Conrateaddressable::Address.addresstype.billing.to_s, user_id: current_user.try(:id))

      if !delivery_address.nil? && !billing_address.nil?
        
      end

      respond_to do |format|
        format.html
        format.json { render json: @order }
      end
    end

    def create
      # TODO: auth
      @order = Order.new(order_params)
      @order.email = current_user.email
      @order.add_line_items_from_cart(current_cart)

      respond_to do |format|
        if @order.save
          Cart.destroy(session[:cart_id])
          session[:cart_id] = nil
          # TODO: send e-mail
          Conratewebshop::OrderMailer.order_email(current_user, @order).deliver_later
          # TODO: send a feldolgozásnál
          format.html { redirect_to main_app.home_path, notice: t('conratewebshop.carts.cart.thank_you_for_your_order') }
          format.json { render json: @order, status: :created, location: @order }
        else
          @cart = current_cart
          format.html { render action: 'new' }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    end

    def success
      # TODO: auth
      @order = Order.find(params[:order_id])
      @order.success = true
      @order.save!
      redirect_to conratewebshop.orders_path(page: params[:page])
    end

    def order_params
      params.require(:order).permit(:name, :address, :email, :mobile, :pay_type, :delivery_type, :terms_of_service)
    end
  end
end
