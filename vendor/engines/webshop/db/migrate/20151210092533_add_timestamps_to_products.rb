class AddTimestampsToProducts < ActiveRecord::Migration
  def change
    add_column :conratewebshop_products, :created_at, :datetime
    add_column :conratewebshop_products, :updated_at, :datetime
  end
end
