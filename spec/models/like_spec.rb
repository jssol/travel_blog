require 'rails_helper'

RSpec.describe Like, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before(:all) do
    @user = User.create(name: 'Gomez', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Spain.')
    @post = Post.create(author_id: @user.id, title: 'My first post', text: 'A good post')
  end

  it 'should return likes_counter increments after saving the post' do
    expect(@post.likes_counter).to be 0

    like = Like.new(author_id: @user.id, post_id: @post.id)
    like.save
    expect(@post.likes_counter).to be 1
  end
end
