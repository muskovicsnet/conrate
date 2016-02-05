# This migration comes from conratesecurity (originally 20160202083827)
class AddDeactivatedToUsers < ActiveRecord::Migration
  def change
    add_column :conratesecurity_users, :deactivated, :boolean, default: false, index: true
  end
end
