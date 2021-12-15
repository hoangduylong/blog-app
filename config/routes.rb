Rails.application.routes.draw do
  devise_for :users
    get 'users/show'
    get 'users/sign_out' => 'devise/sessions#destroy'
  resources :posts do
      resources :comments
  end
  
  root "posts#index"
end
