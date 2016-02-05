# This migration comes from conratewebshop (originally 20151207075713)
class AddPictureToProducts < ActiveRecord::Migration
  def change
    add_column :conratewebshop_products, :picture, :string
  end
end
