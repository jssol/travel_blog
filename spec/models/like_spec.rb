require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    @user = User.create(name: 'Gomez', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Spain.')
    @post = Post.create(author_id: @user.id, title: 'My first post', text: 'A good post')
  end

  it 'should return likes_counter increments after saving the post' do
    expect(@post.likes_counter).to eq(0)
    Like.create(author_id: @user.id, post_id: @post.id)
    expect(@post.likes_counter).to eq(0)
  end
end
