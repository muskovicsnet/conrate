module Conratewebshop
  class Order < ActiveRecord::Base
    PAYMENT_TYPES = %w(online_payment cash_on_delivery)
    DELIVERY_TYPES = %w(personal postal)

    has_many :line_items, dependent: :destroy

    has_one :delivery_address, class_name: 'Conrateaddresses::Address', foreign_key: 'delivery_address_id' 
    has_one :billing_address, class_name: 'Conrateaddresses::Address', foreign_key:  'billing_address_id'

    validates :name, :address, :email, presence: true
    validates :pay_type, inclusion: PAYMENT_TYPES
    validates :delivery_type, inclusion: DELIVERY_TYPES
    validates :terms_of_service, acceptance: {accept: true}, allow_nil: true, on: :create

    def add_line_items_from_cart(cart)
      cart.line_items.each do |item|
        item.cart_id = nil
        line_items << item
      end
    end
  end
end
