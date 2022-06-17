class Post < ApplicationRecord
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id'
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
end
