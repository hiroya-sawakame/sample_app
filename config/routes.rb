Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  # 何故かDELETEメソッドにしてもGETを参照しているから一旦GETにして動かす
  get '/logout', to: 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end