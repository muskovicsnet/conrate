class AddAcceptTermsOfServiceToOrders < ActiveRecord::Migration
  def change
    add_column :conratewebshop_orders, :terms_of_service, :boolean, default: false
  end
end
