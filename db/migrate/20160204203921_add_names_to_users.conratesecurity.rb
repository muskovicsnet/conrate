# This migration comes from conratesecurity (originally 20160204203828)
class AddNamesToUsers < ActiveRecord::Migration
  def change
    add_column :conratesecurity_users, :firstname, :string 
    add_column :conratesecurity_users, :secondname, :string 
    add_column :conratesecurity_users, :thirdname, :string 
    add_column :conratesecurity_users, :mobile, :string 
    add_column :conratesecurity_users, :billingisdelivery, :boolean, default: true
  end
end
