# This migration comes from conratewebshop (originally 20160120200225)
class AddQuantityUnitToProducts < ActiveRecord::Migration
  def change
    add_column :conratewebshop_products, :unitprice, :decimal
    add_column :conratewebshop_products, :unitprice_quantity_unit_id, :integer
    add_column :conratewebshop_products, :quantity, :decimal
    add_column :conratewebshop_products, :quantity_unit_id, :integer
  end
end
