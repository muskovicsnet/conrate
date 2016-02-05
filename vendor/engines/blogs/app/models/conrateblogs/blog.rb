module Conrateblogs
  class Blog < ActiveRecord::Base
    # include Rails.application.routes.url_helpers

    validates :title, presence: true

    has_one :menu, as: :menuable
    has_many :posts, dependent: :destroy

    # def get_href(parent)
    #   # byebug
    #   parent.conrateblogs.blog_path(self)
    # end
  end
end
