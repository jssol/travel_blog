Rails.application.routes.draw do
  root to: redirect('users')

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
    resources :comments, only: [:new, :create]
  end
end
