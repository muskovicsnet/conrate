# This migration comes from conratepages (originally 20160126075750)
class SeedPagesMenuabletype < ActiveRecord::Migration
  def up
    menuable_page = Conratemenus::Menuabletype.create!(classname: 'Conratepages::Page', getelementspath: '/conratepages/pages/listformenu.json') if Conratemenus::Menuabletype.find_by_classname('Conratepages::Page').nil?
  end

  def down
    menuable_page = Conratemenus::Menuabletype.find_by_classname('Conratepages::Page')
    menuable_page.try(:destroy)
  end
end
