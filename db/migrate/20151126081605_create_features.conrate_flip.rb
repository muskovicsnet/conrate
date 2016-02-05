# This migration comes from conrate_flip (originally 20151126072244)
class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :key, null: false
      t.boolean :enabled, null: false, default: false

      t.timestamps null: false
    end
  end
end
