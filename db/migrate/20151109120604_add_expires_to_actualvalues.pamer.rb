# This migration comes from pamer (originally 20151006120115)
class AddExpiresToActualvalues < ActiveRecord::Migration
  def change
    add_column :pamer_actualvalues, :expires, :datetime
  end
end
