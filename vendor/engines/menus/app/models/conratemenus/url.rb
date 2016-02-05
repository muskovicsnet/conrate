module Conratemenus
  class Url < ActiveRecord::Base
    include Rails.application.routes.url_helpers

    has_one :menu, as: :menuable
    # has_many :acls, as: :aclable, dependent: :destroy, class_name: Security::Acl

    def get_href(parent)
      if parseable
        parent.send(:eval, href)
      else
        href
      end
    end
  end
end
