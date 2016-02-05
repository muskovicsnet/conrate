class CreateCarts < ActiveRecord::Migration
  def change
    create_table :conratewebshop_carts do |t|
      t.timestamps
    end
  end
end
