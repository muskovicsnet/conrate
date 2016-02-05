# This migration comes from conrategalleries (originally 20160127065652)
class AddSocialsToGalleries < ActiveRecord::Migration
  def change
    add_column :conrategalleries_galleries, :socials, :boolean, default: false
  end
end
