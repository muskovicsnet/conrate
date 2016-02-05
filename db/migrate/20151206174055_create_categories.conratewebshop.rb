# This migration comes from conratewebshop (originally 20151206173928)
class CreateCategories < ActiveRecord::Migration
  def change
    create_table :conratewebshop_categories do |t|
      t.string :name
    end
  end
end
