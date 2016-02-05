# This migration comes from conratewebshop (originally 20151210092533)
class AddTimestampsToProducts < ActiveRecord::Migration
  def change
    add_column :conratewebshop_products, :created_at, :datetime
    add_column :conratewebshop_products, :updated_at, :datetime
  end
end
