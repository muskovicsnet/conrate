class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :conrateblogs_blogs do |t|
      t.string :title
      t.integer :user_id
      t.text :description

      t.timestamps null: false
    end
  end
end
