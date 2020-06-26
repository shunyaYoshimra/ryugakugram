Rails.application.routes.draw do
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/comment/:post_id', to: 'comments#create'
  resources :users
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:destroy]
  end
  get '/about', to: 'static_pages#about'
  root to: 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
