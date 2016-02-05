class AddIndexToMenuabletypes < ActiveRecord::Migration
  def change
    add_index :conratemenus_menuabletypes, :classname
  end
end
