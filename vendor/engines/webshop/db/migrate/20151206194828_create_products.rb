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
