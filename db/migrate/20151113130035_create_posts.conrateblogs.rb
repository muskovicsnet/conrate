# This migration comes from conrateblogs (originally 20151113123719)
class CreatePosts < ActiveRecord::Migration
  def change
    create_table :conrateblogs_posts do |t|
      t.string :title
      t.text :content
      t.integer :blog_id
      t.boolean :socials, default: false
      t.boolean :comments, default: false
      t.datetime :startdate

      t.timestamps null: false
    end
  end
end
