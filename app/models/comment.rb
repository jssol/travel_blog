class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  def self.update_post_comments_count(post)
    post_comments_count = Comment.where(post_id: post.id).count
    post.comments_counter = post_comments_count
  end
end
