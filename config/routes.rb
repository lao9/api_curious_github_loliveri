Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/user', to: 'users#show', as: 'user'
end
