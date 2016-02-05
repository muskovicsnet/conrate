module Conratepages
  class Page < ActiveRecord::Base
    # include Rails.application.routes.url_helpers

    has_one :menu, as: :menuable

    validates :title, presence: true

    # def get_href(parent)
      # parent.conratepages.page_path(self)
    # end
  end
end
