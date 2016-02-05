module Conratewebshop
  class Pricemanipulator < ActiveRecord::Base
    validates_presence_of [:name, :code]
  end
end
