require 'rails_helper'

RSpec.describe "Users", type: :request do
  it "tests the #index action" do
    get "/users"
    expect(response).to render_template(:index)
    expect(response.body).to include("Here is a list of all the users")
    expect(response).to have_http_status(:ok)
  end

  it "tests the #show action" do
    get "/users/22"
    expect(response).to render_template(:show)
    expect(response.body).to include("Here is a single given user page")
    expect(response).to have_http_status(:ok)
  end
end
