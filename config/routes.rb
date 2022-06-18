Rails.application.routes.draw do
  root to: redirect('users')

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
end
