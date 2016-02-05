# This migration comes from pamer (originally 20151016123410)
class AddTrackingidToOrder < ActiveRecord::Migration
  def change
    add_column :pamer_orders, :trackingid, :string
  end
end
