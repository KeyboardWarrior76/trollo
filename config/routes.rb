Rails.application.routes.draw do
  root 'pages#home'
  
  devise_for :users
  resources :users, only: [:index, :show]

  resources :boards do
    resources :lists, only: [:create, :update, :destroy]
  end

  post "/lists/:id/items" => "items#create"
  put "/lists/:id/items/:id" => "items#update"
  delete "/lists/:id/items/:id" => "items#destroy"


end
