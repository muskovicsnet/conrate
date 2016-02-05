class CreateOrders < ActiveRecord::Migration
  def change
    create_table :conratewebshop_orders do |t|
      t.string :name
      t.text :address
      t.string :email
      t.string :phone
      t.string :pay_type
      t.string :delivery_type

      t.timestamps
    end
  end
end
