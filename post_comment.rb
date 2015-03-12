require './config.rb'

class Post < ActiveRecord::Base
  has_many :comments
  scope :by_types, ->(type = 'article') { where(post_type: type) }
end

class Comment < ActiveRecord::Base
  belongs_to :post
  delegate :post_type, to: :post, allow_nil: :true

  scope :for_videos, -> { joins(:post).merge(Post.where(post_type: 'video')) }
end
