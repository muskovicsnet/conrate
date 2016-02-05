# This migration comes from conratemenus (originally 20151104090916)
class CreateConratemenusMenuabletypes < ActiveRecord::Migration
  def change
    create_table :conratemenus_menuabletypes do |t|
      t.string      :classname
      t.string      :getelementspath

      t.timestamps
    end
  end
end
