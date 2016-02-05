class ChangeOrderFields < ActiveRecord::Migration
  def change
    remove_column :conratewebshop_orders, :name, :string
    remove_column :conratewebshop_orders, :address, :string

    add_column :conratewebshop_orders, :firstname, :string
    add_column :conratewebshop_orders, :secondname, :string
    add_column :conratewebshop_orders, :thirdname, :string

    add_column :conratewebshop_orders, :addresstype, :string
    add_column :conratewebshop_orders, :country, :string
    add_column :conratewebshop_orders, :city, :string
    add_column :conratewebshop_orders, :zip, :string
    add_column :conratewebshop_orders, :publicplace, :string
    add_column :conratewebshop_orders, :publicplace_type, :string
    add_column :conratewebshop_orders, :number, :string
    add_column :conratewebshop_orders, :other, :string

    add_column :conratewebshop_orders, :delivery_address_id, :integer
    add_column :conratewebshop_orders, :billing_address_id, :integer

    add_column :conratewebshop_orders, :billingisdelivery, :boolean, default: true
  end
end
