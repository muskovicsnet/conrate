module Conratemenus
  class Menuabletype < ActiveRecord::Base
    include Rails.application.routes.url_helpers

    def my_name
      I18n.t("conratemenus.menuabletypes.#{classname}.name")
    end
  end
end
