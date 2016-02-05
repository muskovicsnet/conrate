class AddSocialsToGalleries < ActiveRecord::Migration
  def change
    add_column :conrategalleries_galleries, :socials, :boolean, default: false
  end
end
