class CreateConratesecurityIdentities < ActiveRecord::Migration
  def change
    create_table :conratesecurity_identities do |t|
      t.integer :user_id, index: true, foreign_key: true
      t.string :provider
      t.string :uid
      t.string :string

      t.timestamps null: false
    end
  end
end
