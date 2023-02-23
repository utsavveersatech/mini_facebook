Rails.application.routes.draw do
  
  root to: "home#index"

  get 'home/index'
  devise_for :users

  resources :friends
  resources :posts
  resources :requests, only: [:index, :update, :destroy]

  get 'getFollowings', to: "home#get_followings"
  get 'getFollowers', to: "home#get_followers"
  delete 'unfriend', to: "home#unfriend"
  get 'unfriend', to: "home#unfriend"

end
