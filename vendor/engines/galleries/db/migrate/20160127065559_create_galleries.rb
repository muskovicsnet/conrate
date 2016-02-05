class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :conrategalleries_galleries do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
