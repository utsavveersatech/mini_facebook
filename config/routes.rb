Rails.application.routes.draw do
  
  root to: "posts#index"

  devise_for :users
  resources :friends, only: [:index, :create]
  resources :posts, only: [:index, :new, :create, :update, :destroy, :edit]
  resources :requests, only: [:index, :update, :destroy]
  
  get 'get_followings', to: "home#get_followings"
  get 'get_followers', to: "home#get_followers"
  get 'unfriend', to: "home#unfriend"
  delete 'unfriend', to: "home#unfriend"

end
