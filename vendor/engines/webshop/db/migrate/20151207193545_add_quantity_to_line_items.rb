class AddQuantityToLineItems < ActiveRecord::Migration
  def change
    add_column :conratewebshop_line_items, :quantity, :integer, default: 1
  end
end
