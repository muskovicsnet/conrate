class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :conratewebshop_line_items do |t|
      t.integer :product_id
      t.integer :cart_id
    end
  end
end
