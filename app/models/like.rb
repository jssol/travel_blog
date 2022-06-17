class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  def self.update_post_likes_count(post)
    post_likes_count = Like.where(post_id: post.id).count
    post.likes_counter = post_likes_count
  end
end
