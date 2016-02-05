# This migration comes from conratewebshop (originally 20160109155829)
class AddSuccessToOrders < ActiveRecord::Migration
  def change
    add_column :conratewebshop_orders, :success, :boolean
  end
end
