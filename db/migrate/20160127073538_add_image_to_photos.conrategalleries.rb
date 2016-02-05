# This migration comes from conrategalleries (originally 20160127065627)
class AddImageToPhotos < ActiveRecord::Migration
  def change
    add_column :conrategalleries_photos, :image, :string
  end
end
