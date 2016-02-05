# This migration comes from conratewebshop (originally 20151207210211)
class CreateOrders < ActiveRecord::Migration
  def change
    create_table :conratewebshop_orders do |t|
      t.string :name
      t.text :address
      t.string :email
      t.string :mobile
      t.string :pay_type
      t.string :delivery_type

      t.timestamps
    end
  end
end
