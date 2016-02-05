module Conratesecurity
  class Role < ActiveRecord::Base
    def my_name
      role_type == 'USER' ? name : I18n.t("conratesecurity.roles.#{name}")
    end

    validates :name, uniqueness: true
  end
end
