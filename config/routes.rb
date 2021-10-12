Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root :to => 'home#index'
  get '/events', to: 'events#index'
  get '/user_invites', to: 'user_invites#index'
  get '/users', to: 'users#index'
end
