class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def self.update_post_comments_count(post)
    post_comments_count = Post.where(author_id: post.author_id).count
    post.comments_counter = post_comments_count
  end
end
