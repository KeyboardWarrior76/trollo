Rails.application.routes.draw do
  root 'pages#home'
  
  devise_for :users
  resources :users, only: [:index, :show]

  resources :boards do
    resources :list, only: [:create, :update, :destroy]
  end

  post "lists/:id/items" => "item#create"
  put "lists/:id/items/:id" => "item#update"
  delete "lists/:id/items/:id" => "item#destroy"


end
