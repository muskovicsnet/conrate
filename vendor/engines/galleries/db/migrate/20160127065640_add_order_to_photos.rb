class AddOrderToPhotos < ActiveRecord::Migration
  def change
    add_column :conrategalleries_photos, :ordernum, :integer
  end
end
