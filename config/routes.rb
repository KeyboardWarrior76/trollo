Rails.application.routes.draw do
  root 'users#show'
  
  devise_for :users
  resources :users, only: [:index, :show]

  resources :boards do
    resources :lists, only: [:create, :update, :destroy]
  end

  post "/lists/:id/items" => "items#create"
  put "/lists/:id/items/:id" => "items#update"
  delete "/lists/:id/items/:id" => "items#destroy"

  post "/boards/:board_id/user/:id/userboards" => "user_boards#create"
  delete "/boards/:board_id/user/:id/userboards" => "user_boards#destroy"

end
