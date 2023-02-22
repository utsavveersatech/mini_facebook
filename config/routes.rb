Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get 'findFriends', to: "home#find_friends"
  post 'addFriends', to: "home#add_friends"
  get 'addFriends', to: "home#add_friends"
  get 'getFollowings', to: "home#get_followings"
  get 'getFollowers', to: "home#get_followers"
  get 'friendRequest', to: "home#friend_request"
  put 'acceptRequest', to: "home#accept_request"
  get 'acceptRequest', to: "home#accept_request"
  delete 'rejectRequest', to: "home#reject_request"
  delete 'unfriend', to: "home#unfriend"
  get 'unfriend', to: "home#unfriend"
end
