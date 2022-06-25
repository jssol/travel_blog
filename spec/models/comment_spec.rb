require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @user = User.create(name: 'Gomez', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Spain.')
    @post = Post.create(author_id: @user.id, title: 'My first post', text: 'A good post')
  end

  it 'should return comments_counter increments after saving the post' do
    expect(@post.comments_counter).to eq(0)
    Comment.create(author_id: @user.id, post_id: @post.id)
    expect(@post.comments_counter).to eq(0)
  end
end
