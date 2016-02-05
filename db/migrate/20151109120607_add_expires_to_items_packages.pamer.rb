# This migration comes from pamer (originally 20151014132715)
class AddExpiresToItemsPackages < ActiveRecord::Migration
  def change
    add_column :pamer_items_packages, :expires_time, :integer
    add_column :pamer_items_packages, :expires_unit, :string
  end
end
