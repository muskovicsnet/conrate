# This migration comes from conrategalleries (originally 20160127065619)
class AddFileToPhotos < ActiveRecord::Migration
  def change
    add_column :conrategalleries_photos, :file, :string
    add_column :conrategalleries_photos, :photo, :string
  end
end
