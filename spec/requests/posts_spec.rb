require 'rails_helper'

RSpec.describe "Posts", type: :request do
  it "tests the #index action" do
    get "/users/12/posts"
    expect(response).to render_template(:index)
    expect(response.body).to include("Here is a list of posts for a given user")
    expect(response).to have_http_status(:ok)
  end

  it "tests the #show action" do
    get "/users/12/posts/11"
    expect(response).to render_template(:show)
    expect(response.body).to include("Here is a single post made by a given user")
    expect(response).to have_http_status(:ok)
  end
end
