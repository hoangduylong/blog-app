Rails.application.routes.draw do
  devise_for :users
  get 'users/show'
  resources :posts do
      resources :comments
  end
  
  root "posts#index"
end
