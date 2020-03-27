Rails.application.routes.draw do
  root 'memos#index'
  resources :memos

  # root to: 'memos#index'
  # get '/new', to: 'memos#new'
  # post '/create', to: 'memos#create'
  # delete '/memos/:id', to: 'memos#delete'
  # get '/memos/:id/edit', to: 'memos#edit'
  # patch '/memos/:id', to: 'memos#update'
  get '/category/:id', to: 'categories#show'
end
