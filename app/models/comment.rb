class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_post_comments_count

  def update_post_comments_count
    post_comments_count = Comment.where(post_id: post.id).count
    post.comments_counter = post_comments_count
  end
end
