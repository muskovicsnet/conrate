# This migration comes from conrategalleries (originally 20160127065640)
class AddOrderToPhotos < ActiveRecord::Migration
  def change
    add_column :conrategalleries_photos, :ordernum, :integer
  end
end
