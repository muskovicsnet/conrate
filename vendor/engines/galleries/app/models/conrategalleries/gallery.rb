module Conrategalleries
  class Gallery < ActiveRecord::Base
    include Rails.application.routes.url_helpers

    has_many :photos
    validates_presence_of :title

    def get_href(parent)
      parent.galleries.gallery_path(self)
    end
  end  
end
