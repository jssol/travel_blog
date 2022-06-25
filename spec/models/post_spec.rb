require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @user = User.create(name: 'Gomez', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Spain.')
    @post = Post.create(author_id: @user.id, title: 'My first post', text: 'A good post')
  end

  it 'should return comments_counter greater than or equal to 0' do
    @post.comments_counter = -10
    expect(@post).to_not be_valid

    @post.comments_counter = 0
    expect(@post).to be_valid

    @post.comments_counter = 10
    expect(@post).to be_valid
  end

  it 'should return likes_counter greater than or equal to 0' do
    @post.likes_counter = -10
    expect(@post).to_not be_valid

    @post.likes_counter = 0
    expect(@post).to be_valid

    @post.likes_counter = 10
    expect(@post).to be_valid
  end

  it 'should have likes_counter numericaly' do
    @post.likes_counter = 'one'
    expect(@post).to_not be_valid

    @post.likes_counter = 20
    expect(@post).to be_valid
  end

  it 'should have title not empty' do
    @post.title = 'My first post'
    expect(@post).to be_valid

    @post.title = ''
    expect(@post).to_not be_valid
  end

  it 'should have title not equal to nil' do
    @post.title = nil
    expect(@post).to_not be_valid
  end

  it 'should have title max length 250' do
    @post.title = 'a' * 251
    expect(@post).to_not be_valid

    @post.title = 'b' * 250
    expect(@post).to be_valid
  end

  it 'should return less than 5 comments ' do
    value = Post.latest_comments(@post).length
    expect(value).to be < 5
  end
end
