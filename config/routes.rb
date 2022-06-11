Rails.application.routes.draw do
  get "users", to: "users#index"
  get "users/:user_id/posts/:post_id", to: "users#show_user_post"
  get "users/:user_id/posts", to: "users#show_user_posts"
  get "users/:user_id", to: "users#show_user"
end
