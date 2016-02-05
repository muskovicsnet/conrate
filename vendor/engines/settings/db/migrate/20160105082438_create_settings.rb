class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.string :var, :null => false
      t.text   :value, :null => true
      t.integer :thing_id, :null => true
      t.string :thing_type, :limit => 30, :null => true
      t.string :locale
      t.boolean :localizable, default: false
      t.timestamps
    end

    add_index :settings, [ :thing_type, :thing_id, :var, :locale ], :unique => true, name: 'index_settings_on_all'
  end

  def self.down
    drop_table :settings
  end
end
