class AddOrderIdToLineItem < ActiveRecord::Migration
  def change
    add_column :conratewebshop_line_items, :order_id, :integer
  end
end
