require 'rails_helper'

RSpec.describe Comment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before(:all) do
    @user = User.create(name: 'Gomez', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Spain.')
    @post = Post.create(author_id: @user.id, title: 'My first post', text: 'A good post')
  end

  it 'should return comments_counter increments after saving the post' do
    expect(@post.comments_counter).to be 0

    comment = Comment.new(author_id: @user.id, post_id: @post.id)
    comment.save
    expect(@post.comments_counter).to be 1
  end
end
