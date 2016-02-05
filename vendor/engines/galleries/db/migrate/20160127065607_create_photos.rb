class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :conrategalleries_photos do |t|
      t.string :title
      t.integer :gallery_id

      t.timestamps
    end
  end
end
