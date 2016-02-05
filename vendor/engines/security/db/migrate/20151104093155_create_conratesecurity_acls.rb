class CreateConratesecurityAcls < ActiveRecord::Migration
  def change
    create_table :conratesecurity_acls do |t|
      t.integer :user_id
      t.string :user_type
      t.integer :role_id
      t.string :role_type
      t.string :access_type

      t.references :aclable, polymorphic: true

      t.timestamps
    end

    add_index(:conratesecurity_acls, :user_id)
    add_index(:conratesecurity_acls, :role_id)
    add_index(:conratesecurity_acls, [:user_id, :access_type])
    add_index(:conratesecurity_acls, [:role_id, :access_type])
    add_index(:conratesecurity_acls, [:aclable_id, :aclable_type])
  end
end
