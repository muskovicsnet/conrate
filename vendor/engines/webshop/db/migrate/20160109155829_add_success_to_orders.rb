class AddSuccessToOrders < ActiveRecord::Migration
  def change
    add_column :conratewebshop_orders, :success, :boolean
  end
end
