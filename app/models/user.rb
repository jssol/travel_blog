class User < ApplicationRecord
  has_many :comments, class_name: 'Comment', foreign_key: 'author_id'
  has_many :likes, class_name: 'Like', foreign_key: 'author_id'
  has_many :posts, class_name: 'Post', foreign_key: 'author_id'

  def self.latest_posts(user)
    Post.where(author_id: user.id).limit(3).order(created_at: :desc)
  end
end
