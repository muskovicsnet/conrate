# This migration comes from conratemenus (originally 20160126084053)
class AddIndexToMenuabletypes < ActiveRecord::Migration
  def change
    add_index :conratemenus_menuabletypes, :classname
  end
end
