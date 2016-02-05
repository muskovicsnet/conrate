module Conrategalleries
  class PhotoUploader < CarrierWave::Uploader::Base
    include CarrierWave::RMagick

    #include Sprockets::Helpers::RailsHelper
    #include Sprockets::Helpers::IsolatedHelper

    storage :file

    process :resize_to_limit => [1024, 1024]
    process :fix_exif_rotation
    #process :convert => 'jpg'

    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"  
    end

    def extension_white_list
      %w(jpg jpeg gif png)
    end

    version :thumbnail do
      process :resize_to_fill => [200, 200]
    end

    def fix_exif_rotation
      manipulate! do |img|
        img.auto_orient!
        img = yield(img) if block_given?
        img
      end
    end
  end
end
