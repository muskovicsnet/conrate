class AddUserToCart < ActiveRecord::Migration
  def change
    add_column :conratewebshop_carts, :user_id, :integer
  end
end
