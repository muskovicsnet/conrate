module Conratewebshop
  class LineItem < ActiveRecord::Base
    belongs_to :order
    belongs_to :product
    belongs_to :cart

    def total_price
      return 0 if product.try(:price).blank?
      product.price * quantity
    end
  end
end
