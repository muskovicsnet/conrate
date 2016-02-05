module Conrateblogs
  class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :blog_id, presence: true

    belongs_to :blog
  end
end
