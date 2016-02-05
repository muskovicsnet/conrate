# This migration comes from conratewebshop (originally 20151206194828)
class CreateProducts < ActiveRecord::Migration
  def change
    create_table :conratewebshop_products do |t|
      t.integer :category_id
      t.string :name
      t.string :description
      t.decimal :price
    end
  end
end
