class User < ApplicationRecord
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy
  has_many :posts, foreign_key: 'author_id', dependent: :destroy

  def self.latest_posts(user)
    Post.where(author_id: user.id).limit(3).order(created_at: :desc)
  end
end
