class CreatePages < ActiveRecord::Migration
  def change
    create_table :conratepages_pages do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
