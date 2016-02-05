# This migration comes from pamer (originally 20151013101813)
class AddChangegroupToPackages < ActiveRecord::Migration
  def change
    add_column :pamer_packages, :changegroup, :string
  end
end
