module Conratewebshop
  class Category < ActiveRecord::Base
    acts_as_nested_set

    has_many :products
    belongs_to :parent, class_name: 'Conratewebshop::Category'

    before_save :add_to_root_category

    validates :name, presence: true

    def add_to_root_category
      self.parent_id = Conratewebshop::Category.find_by_name('.system_root').id if(self.parent_id.nil? && self.name != '.system_root')
    end
  end
end
