module Conratemenus
  module MenusHelper
    def self.reorder_by_relposition
      Conratemenus::Menu.order(:relposition).each_with_index do |menu, index|
        menu['lft'] = index
        menu.save!
      end
      Conratemenus::Menu.rebuild!
    end
  end
end