module Conrategalleries
  class Photo < ActiveRecord::Base
    #include Rails.application.routes.url_helpers
    mount_uploader :file, Conrategalleries::PhotoUploader
    belongs_to :gallery

    before_create :default_name

    def default_name
    	self.title ||= File.basename(file.filename, '.*').titleize if file
    end
  end
end
