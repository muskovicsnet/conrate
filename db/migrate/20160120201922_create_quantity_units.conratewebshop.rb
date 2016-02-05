# This migration comes from conratewebshop (originally 20160120200128)
class CreateQuantityUnits < ActiveRecord::Migration
  def up
    create_table :conratewebshop_quantity_units do |t|
      t.string :name
      t.string :abbr
      t.boolean :translateable, default: false

      t.timestamps
    end
    create_table :conratewebshop_conversions do |t|
      t.integer :from_id
      t.integer :to_id
      t.decimal :quantity
    end
    add_index :conratewebshop_conversions, [:from_id, :to_id]

    Conratewebshop::QuantityUnit.create(name: 'piece', abbr: 'pcs', translateable: true)
    Conratewebshop::QuantityUnit.create(name: 'meter', abbr: 'm', translateable: true)
    kg = Conratewebshop::QuantityUnit.create(name: 'kilogram', abbr: 'kg', translateable: true)
    dkg = Conratewebshop::QuantityUnit.create(name: 'dekagram', abbr: 'dkg', translateable: true)
    g = Conratewebshop::QuantityUnit.create(name: 'gram', abbr: 'g', translateable: true)
    Conratewebshop::QuantityUnit.create(name: 'liter', abbr: 'l', translateable: true)

    Conratewebshop::Conversion.create(from_id: kg.id, to_id: g.id, quantity: 1000)
    Conratewebshop::Conversion.create(from_id: dkg.id, to_id: g.id, quantity: 100)
  end

  def down
    drop_table :conratewebshop_quantity_units
  end
end
