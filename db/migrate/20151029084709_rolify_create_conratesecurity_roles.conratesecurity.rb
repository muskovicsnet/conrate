# This migration comes from conratesecurity (originally 20151029084543)
class RolifyCreateConratesecurityRoles < ActiveRecord::Migration
  def change
    create_table(:conratesecurity_roles) do |t|
      t.string :name
      t.references :resource, :polymorphic => true
      t.string :role_type, :default => 'USER'
      t.integer :priority

      t.timestamps
    end

    create_table(:conratesecurity_users_conratesecurity_roles, :id => false) do |t|
      t.references :user
      t.references :role
    end

    add_index(:conratesecurity_roles, :name)
    add_index(:conratesecurity_roles, [ :name, :resource_type, :resource_id ], name: 'index_conratesecurity_roles_on_name_resourcetype_resourceid')
    add_index(:conratesecurity_users_conratesecurity_roles, [ :user_id, :role_id ], name: 'index_conratesecurity_users_roles_user_role')
    add_index :conratesecurity_roles, :priority, :unique => true
  end
end

