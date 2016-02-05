class AddPictureToProducts < ActiveRecord::Migration
  def change
    add_column :conratewebshop_products, :picture, :string
  end
end
