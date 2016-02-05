module Conratesecurity
  class Acl < ActiveRecord::Base
    extend Enumerize
    extend ActiveModel::Naming

    belongs_to :aclable, polymorphic: true
    belongs_to :user
    belongs_to :role

    enumerize :access_type, in: [:index, :show, :new, :edit, :destroy, :menu]
  end
end