require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.create(name: 'Gomez', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Spain.')
  end

  it 'should return posts_counter greater than or equal to 0' do
    @user.posts_counter = -20
    expect(@user).to_not be_valid

    @user.posts_counter = 0
    expect(@user).to be_valid

    @user.posts_counter = 20
    expect(@user).to be_valid
  end

  it 'should have name not equal to nil' do
    @user.name = 'Gomez'
    expect(@user).to be_valid

    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'should have post counter numericaly' do
    @user.posts_counter = 'one'
    expect(@user).to_not be_valid
  end

  it 'should return less than 5 posts ' do
    value = User.latest_posts(@user).length
    expect(value).to be < 5
  end

  it 'should have name not empty' do
    @user.name = ''
    expect(@user).to_not be_valid
  end

  it 'should return less than 5 posts ' do
    value = User.latest_posts(@user).length
    expect(value).to be < 5
  end
end
