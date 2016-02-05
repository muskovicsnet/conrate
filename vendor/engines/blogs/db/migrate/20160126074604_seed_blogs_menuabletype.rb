class SeedBlogsMenuabletype < ActiveRecord::Migration
  def up
    menuable_blog = Conratemenus::Menuabletype.create!(classname: 'Conrateblogs::Blog', getelementspath: '/conrateblogs/blogs/listformenu.json') if Conratemenus::Menuabletype.find_by_classname('Conrateblogs::Blog').nil?
  end

  def down
    menuable_blog = Conratemenus::Menuabletype.find_by_classname('Conrateblogs::Blog')
    menuable_blog.try(:destroy)
  end
end
