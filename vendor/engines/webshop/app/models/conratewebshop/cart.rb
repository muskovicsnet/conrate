module Conratewebshop
  class Cart < ActiveRecord::Base
    has_many :line_items, dependent: :destroy

    def add_product(product_id)
      current_item = line_items.find_by_product_id(product_id)
      if current_item
        current_item.quantity += 1
      else
        current_item = line_items.build(product_id: product_id)
      end
      current_item
    end

    def pricemanipulators
      Dentaku.enable_ast_cache!
      res = []
      unless first_total_price == 0
        Conratewebshop::Pricemanipulator.where(perproduct: false).each do |pm|
          begin
            val = calculation(pm).call
            if !val.nil? && ((val != 0) || (val == 0 && pm.showifzero))
              res << [pm.name, val]
            end
          rescue
          end
        end
      end
      res
    end

    # total price without pricemanipulators
    def first_total_price
      line_items.to_a.sum { |item| item.total_price }
    end

    def total_price
      Dentaku.enable_ast_cache!
      plus = BigDecimal(0)
      unless first_total_price == 0
        Conratewebshop::Pricemanipulator.where(perproduct: false).each do |pm|
          # TODO: nil values
          begin
            val = calculation(pm).call
            unless val.nil?
              plus += val
            end
          rescue
          end
        end
      end
      first_total_price + plus
    end

    private

    def calculation(pm)
      Proc.new do
        val = Dentaku::Calculator.new.evaluate pm.code, total_price: first_total_price, city: nil, payment_method: nil, total_weight: nil, total_size: nil, user_id: user_id
      end
    end
  end
end
