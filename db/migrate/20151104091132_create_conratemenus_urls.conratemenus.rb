# This migration comes from conratemenus (originally 20151104091014)
class CreateConratemenusUrls < ActiveRecord::Migration
  def change
    create_table :conratemenus_urls do |t|
      t.string :href
      t.boolean :parseable, default: false
      t.integer :target, default: 0

      t.timestamps
    end
  end
end
