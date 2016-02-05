module Conrateaddressable
  class Address < ActiveRecord::Base
    extend Enumerize
    extend ActiveModel::Naming

    belongs_to :user
    enumerize :addresstype, in: [:delivery, :billing]
  end
end
