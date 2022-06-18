class Post < ApplicationRecord
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id', dependent: :destroy
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'

  after_save :update_user_posts_count

  def update_user_posts_count
    user_posts_count = Post.where(author_id: params[:user_id]).count
    user.posts_counter = user_posts_count
  end

  def self.latest_comments(post)
    Comment.where(post_id: post.id).limit(5).order(created_at: :desc)
  end
end
