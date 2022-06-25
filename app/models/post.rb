class Post < ApplicationRecord
  has_many :likes, class_name: 'Like', foreign_key: 'post_id', dependent: :destroy
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id', dependent: :destroy
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  after_save :update_post_counter

  validates :title, presence: true, allow_blank: false, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def self.latest_comments(post)
    Comment.order(created_at: :desc).includes([:author]).limit(5)
  end

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end
