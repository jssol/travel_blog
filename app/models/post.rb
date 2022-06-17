class Post < ApplicationRecord
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id'
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'

  def self.update_user_posts_count(user)
    user_posts_count = Post.where(author_id: user.id).count
    user.posts_counter = user_posts_count
  end

  def self.latest_comments(post)
    Comment.where(post_id: post.id).limit(5).order(created_at: :desc)
  end
end
