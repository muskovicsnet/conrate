# This migration comes from conratewebshop (originally 20160109092613)
class AddParentToCategories < ActiveRecord::Migration
  def change
    add_column :conratewebshop_categories, :parent_id, :integer, :null => true, :index => true
    add_column :conratewebshop_categories, :lft, :integer, :index => true
    add_column :conratewebshop_categories, :rgt, :integer, :index => true
    add_column :conratewebshop_categories, :depth, :integer, :null => false, :default => 0
    add_column :conratewebshop_categories, :children_count, :integer, :null => false, :default => 0

    add_index :conratewebshop_categories, 'parent_id'
    add_index :conratewebshop_categories, 'rgt'
    add_index :conratewebshop_categories, 'lft'
    add_index :conratewebshop_categories, 'depth'

    Conratewebshop::Category.create(name: '.system_root')
    Conratewebshop::Category.all.each do |category|
      category.touch
      category.save!
    end
    Conratewebshop::Category.rebuild!
  end
end
