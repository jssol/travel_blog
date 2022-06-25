require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'tests the #index action' do
    before(:each) do
      get '/users/1/posts'
    end

    it 'should render the correct template' do
      expect(response).to render_template(:index)
    end

    it 'should have a correct response status' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'tests the #show action' do
    before(:each) do
      get '/users/1/posts/1'
    end

    it 'should render the correct template' do
      expect(response).to render_template(:show)
    end

    it 'should have a correct response status' do
      expect(response).to have_http_status(:ok)
    end
  end
end
