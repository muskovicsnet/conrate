# This migration comes from conratewebshop (originally 20160121080830)
class AddAcceptTermsOfServiceToOrders < ActiveRecord::Migration
  def change
    add_column :conratewebshop_orders, :terms_of_service, :boolean, default: false
  end
end
