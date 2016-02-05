class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :conrateaddressable_addresses do |t|
      t.string :addresstype, index: true
      t.string :country
      t.string :city
      t.string :zip
      t.string :publicplace
      t.string :publicplace_type
      t.string :number
      t.string :other
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
