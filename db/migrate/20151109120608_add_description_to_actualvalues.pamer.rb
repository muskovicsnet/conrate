# This migration comes from pamer (originally 20151015065917)
class AddDescriptionToActualvalues < ActiveRecord::Migration
  def change
    add_column :pamer_actualvalues, :description, :string
  end
end
