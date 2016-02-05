class SeedHomeSettings < ActiveRecord::Migration
  def up
    Settings.create(var: 'conratethemes.homepage', value: '', localizable: true)
  end

  def down

  end
end
