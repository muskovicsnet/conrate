class AddDeactivatedToUsers < ActiveRecord::Migration
  def change
    add_column :conratesecurity_users, :deactivated, :boolean, default: false, index: true
  end
end
