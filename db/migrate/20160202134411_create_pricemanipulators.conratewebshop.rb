# This migration comes from conratewebshop (originally 20160202130859)
class CreatePricemanipulators < ActiveRecord::Migration
  def change
    create_table :conratewebshop_pricemanipulators do |t|
      t.string :name
      t.integer :order
      t.text :code
      t.boolean :perproduct, default: false, index: true
      t.boolean :showifzero, default: false, index: true

      t.timestamps
    end
  end
end
