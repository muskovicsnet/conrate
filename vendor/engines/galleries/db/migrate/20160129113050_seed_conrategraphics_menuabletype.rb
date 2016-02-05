class SeedConrategraphicsMenuabletype < ActiveRecord::Migration
  def up
    menuable_gallery = Conratemenus::Menuabletype.create!(classname: 'Conrategalleries::Gallery', getelementspath: '/conrategalleries/galleries/listformenu.json') if Conratemenus::Menuabletype.find_by_classname('Conrategalleries::Gallery').nil?
  end

  def down
  end
end
