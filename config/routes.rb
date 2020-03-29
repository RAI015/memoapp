Rails.application.routes.draw do
  root 'memos#index'
  # root 'home#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/mypage', to: 'users#me'
  resources :users, only: %i[new create]
  resources :memos

  get '/category/:id', to: 'categories#show'
end
