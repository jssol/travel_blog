require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'tests the #index action' do
    before(:each) do
      get '/users'
    end

    it 'should render the correct template' do
      expect(response).to render_template(:index)
    end

    it 'should have the correct placeholder text' do
      expect(response.body).to include('Here is a list of all the users')
    end

    it 'should have a correct response status' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'tests the #show action' do
    before(:each) do
      get '/users/22'
    end

    it 'should render the correct template' do
      expect(response).to render_template(:show)
    end

    it 'should have the correct placeholder text' do
      expect(response.body).to include('Here is a single given user page')
    end

    it 'should have a correct response status' do
      expect(response).to have_http_status(:ok)
    end
  end
end
