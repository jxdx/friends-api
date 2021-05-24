Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'login', to: 'authentication#create'
  post 'signup', to: 'users#create'
  get 'users', to: 'users#index'
  post 'friendships', to: 'friendships#create'
  get 'users/me/friends', to: 'friendships#index'
end
