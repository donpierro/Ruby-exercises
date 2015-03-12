require './config.rb'

class Post < ActiveRecord::Base
  has_many :comments
  scope :by_types, ->(type = 'article') { where(post_type: type) }
end

class Comment < ActiveRecord::Base
  belongs_to :post
  scope :for_videos, -> { joins(:post).where(posts: { post_type: 'video' }) }

  def post_type
    post.nil? ? nil : post.post_type
  end
end
