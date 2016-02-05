class AddImageToPhotos < ActiveRecord::Migration
  def change
    add_column :conrategalleries_photos, :image, :string
  end
end
