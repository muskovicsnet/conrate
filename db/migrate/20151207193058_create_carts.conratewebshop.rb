# This migration comes from conratewebshop (originally 20151207193000)
class CreateCarts < ActiveRecord::Migration
  def change
    create_table :conratewebshop_carts do |t|
      t.timestamps
    end
  end
end
