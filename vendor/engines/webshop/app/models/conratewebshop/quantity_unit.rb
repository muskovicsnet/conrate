module Conratewebshop
  class QuantityUnit < ActiveRecord::Base
    validates :name, presence: true
    validates :abbr, presence: true

    def get_name
      if translateable
        I18n.t("conratewebshop.quantity_units.names.#{name}")
      else
        name
      end
    end

    def get_abbr
      if translateable
        I18n.t("conratewebshop.quantity_units.abbrs.#{name}")
      else
        abbr
      end
    end
  end
end
