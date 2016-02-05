class SeedWebshopMenuabletype < ActiveRecord::Migration
  def up
    menuable_webshop = Conratemenus::Menuabletype.create!(classname: 'Conratewebshop::Category', getelementspath: '/conratewebshop/categories/listformenu.json') if Conratemenus::Menuabletype.find_by_classname('Conratewebshop::Category').nil?
  end

  def down
    menuable_webshop = Conratemenus::Menuabletype.find_by_classname('Conratewebshop::Category')
    menuable_webshop.try(:destroy)
  end
end
