Rails.application.routes.draw do
  root to: "toppages#index"
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get "signup", to: 'users#new'
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"
  resources :users, only: [:index, :show, :create, :destroy] do
    member do
      get :followings
      get :followers
    end
  end
  
  resources :posts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
  
end


