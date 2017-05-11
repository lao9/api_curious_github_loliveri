Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/user', to: 'users#show', as: 'user'
  resources :starred_repos, only: [:index]
  resources :repos, only: [:index]
  resources :followers, only: [:index]
  resources :followings, only: [:index]
end
