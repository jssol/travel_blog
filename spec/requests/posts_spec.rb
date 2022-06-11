require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'tests the #index action' do
    before(:each) do
      get '/users/12/posts'
    end

    it 'should render the correct template' do
      expect(response).to render_template(:index)
    end

    it 'should have the correct placeholder text' do
      expect(response.body).to include('Here is a list of posts for a given user')
    end

    it 'should have a correct response status' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'tests the #show action' do
    before(:each) do
      get '/users/12/posts/11'
    end

    it 'should render the correct template' do
      expect(response).to render_template(:show)
    end

    it 'should have the correct placeholder text' do
      expect(response.body).to include('Here is a single post made by a given user')
    end

    it 'should have a correct response status' do
      expect(response).to have_http_status(:ok)
    end
  end
end
