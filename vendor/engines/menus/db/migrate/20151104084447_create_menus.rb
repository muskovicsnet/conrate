class CreateMenus < ActiveRecord::Migration
  def change
    create_table :conratemenus_menus do |t|
      t.string :title
      t.references :menuable, polymorphic: true
      t.string :module_path
      t.boolean :translateable, default: false
      t.boolean :editable, default: false
      t.boolean :cantmove, default: false
      t.string :locale_id
      t.integer :relposition, default: 0
      t.string :icon
      t.string :target

      t.integer :parent_id, null: true, index: true
      t.integer :lft, null: false, index: true
      t.integer :rgt, null: false, index: true

      t.integer :depth, null: false, default: 0
      t.integer :children_count, null: false, default: 0
    end

    add_index   :conratemenus_menus,   :locale_id
    add_index   :conratemenus_menus,   :title
    # add_index   :conratemenus_menus,   :parent_id
    add_index   :conratemenus_menus,   [:menuable_id, :menuable_type]
  end
end
