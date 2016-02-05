# This migration comes from conratewebshop (originally 20151207193545)
class AddQuantityToLineItems < ActiveRecord::Migration
  def change
    add_column :conratewebshop_line_items, :quantity, :integer, default: 1
  end
end
