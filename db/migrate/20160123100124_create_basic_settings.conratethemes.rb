# This migration comes from conratethemes (originally 20160105084337)
class CreateBasicSettings < ActiveRecord::Migration
  def change
    Settings.create(var: 'conratethemes.theme', value: 'simple', localizable: true)
    Settings.create(var: 'conratethemes.ga_number', value: '', localizable: true)
  end
end
