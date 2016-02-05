# This migration comes from conrategalleries (originally 20160127065559)
class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :conrategalleries_galleries do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
